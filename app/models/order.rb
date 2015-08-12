class Order < ActiveRecord::Base
  has_many :order_line_items, dependent: :destroy
  accepts_nested_attributes_for :order_line_items

  validates :name, presence: true
  validates :phone_number, length: {is: 10}, numericality: {only_integer: true}
  validate :must_have_one_line_item

  validate :charge_credit_card, :on => :create

  after_create :notify_new_order, :sendConfirmationText

  def must_have_one_line_item
    if !self.order_line_items.any?
      errors.add(:order_line_items, "must have at least one order line item")
    end
  end

  def charge_credit_card
    if !self.errors.any?
      result = Braintree::Transaction.sale(
          :amount => self.totalPrice,
          :payment_method_nonce => self.nonce,
          :options => {
              :submit_for_settlement => true
          }
      )
      if result.success?
        self.status = "paid"
        self.bt_transaction_id = result.transaction.id
      else
        errors[:base] << result.message
      end
    end
  end

  def totalPrice
    total = 0
    self.order_line_items.each do |li|
      total += li.flavor.price.to_f * li.quantity
    end
    return total.round(2)
  end

  def sendConfirmationText
    client = Twilio::REST::Client.new
    client.messages.create(
        from: '+15129601502',
        to: self.phone_number,
        body: 'This is an auto confirmation from zoe-doodle.com. Thank you for your order. We will contact you soon via text message to arrange delivery.'
    )
  end

  def notify_new_order
    $redis.publish('message', {type: 'newOrder'}.to_json)
  end

  handle_asynchronously :sendConfirmationText
end

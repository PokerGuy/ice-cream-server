class Donation < ActiveRecord::Base

  validates :name, presence: true
  validates :amount, :numericality => {:greater_than_or_equal_to => 1}
  validate :process_credit_card, :on => :create

  after_create :notify_donation_added

  def name
    if (self[:allow_display])
      return self[:name]
    else
      return "Anonymous"
    end
  end

  def process_credit_card
    if !self.errors.any?
      result = Braintree::Transaction.sale(
          :amount => self.amount,
          :payment_method_nonce => self.nonce,
          :options => {
              :submit_for_settlement => true
          }
      )
      if result.success?
        self.bt_transaction_id = result.transaction.id
      else
        errors[:base] << result.message
      end
    end
  end

  private
  def notify_donation_added
    $redis.publish('message', {type: 'donationAdded', name: self.name, amount: self.amount, created_at: self.created_at}.to_json)
  end

end

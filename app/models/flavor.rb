class Flavor < ActiveRecord::Base

  validate :has_price
  validates :stock_quantity, numericality: {only_integer: true, :greater_than_or_equal_to => 0}
  validates :name, presence: true

  has_many :order_line_items
  has_many :prices

  accepts_nested_attributes_for :prices

  after_update :publish_stock_quantity

  after_create :publish_stock_quantity

  def price
    return self.prices.where(["? between start_date and end_date", DateTime.now]).first.price
  end

  def has_price
    if !self.prices.any?
      errors.add(:price, "must have at least one valid price")
    end
  end

  def publish_stock_quantity
    $redis.publish('message', {type: 'flavorChange', name: self.name, price: self.price.to_f, id: self.id, stock_quantity: self.stock_quantity}.to_json)
  end

end

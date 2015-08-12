class OrderLineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :flavor

  validates :quantity, numericality: {only_integer: true, :greater_than_or_equal_to => 1}

  validate :decrement_stock, :on => :create

  def decrement_stock
    if !(self.flavor.update(:stock_quantity => self.flavor.stock_quantity - self.quantity))
      errors.add(:quantity, "error. Only #{self.flavor.changed_attributes['stock_quantity']} pints of #{self.flavor.name} available.")
    end
  end

end

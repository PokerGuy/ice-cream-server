class Price < ActiveRecord::Base
  belongs_to :flavor

  before_validation :check_dates

  def check_dates
    if !self.start_date
      self.start_date = '1/1/1900'
    end
    if !self.end_date
      self.end_date = '1/1/2037'
    end
  end
end

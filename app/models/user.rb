class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  before_validation :set_uid

  def set_uid
    self.uid = email if uid.blank?
    self[:provider] = "email" if self[:provider].blank?
  end

end

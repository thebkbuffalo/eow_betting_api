class User < ApplicationRecord
  has_many :bets
  require "securerandom"

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  def full_name
    return "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end
end

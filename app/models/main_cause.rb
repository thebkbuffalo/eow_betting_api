class MainCause < ApplicationRecord
  has_many :sub_causes, dependent: :delete_all
  has_many :bets
end

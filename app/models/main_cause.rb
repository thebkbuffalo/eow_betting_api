class MainCause < ApplicationRecord
  has_many :sub_causes
  has_many :bets
end

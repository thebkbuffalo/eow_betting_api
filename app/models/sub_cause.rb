class SubCause < ApplicationRecord
  belongs_to :main_cause
  has_many :bets
end

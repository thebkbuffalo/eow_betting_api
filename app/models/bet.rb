class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :main_cause
  belongs_to :sub_cause, optional: true
  after_save :increment_usage_count

  private
    def increment_usage_count
      if self.main_cause.present?
        self.main_cause.update_attribute('count', +1)
      end
      if self.sub_cause.present?
        self.sub_cause.update_attribute('count', +1)
      end
    end
end

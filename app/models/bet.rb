class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :main_cause
  belongs_to :sub_cause, optional: true
  after_save :increment_usage_count

  private
    def increment_usage_count
      if self.main_cause.present?
        new_count_main = self.main_cause.count + 1
        self.main_cause.update_attribute('count', new_count_main)
      end
      if self.sub_cause.present?
        new_count_sub = self.sub_cause.count + 1
        self.sub_cause.update_attribute('count', new_count_sub)
      end
    end
end

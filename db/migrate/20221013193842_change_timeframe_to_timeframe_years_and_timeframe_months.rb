class ChangeTimeframeToTimeframeYearsAndTimeframeMonths < ActiveRecord::Migration[7.0]
  def change
    remove_column :bets, :timeframe
    add_column :bets, :timeframe_years, :integer
    add_column :bets, :timeframe_months, :integer
  end
end

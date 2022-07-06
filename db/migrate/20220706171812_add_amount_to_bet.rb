class AddAmountToBet < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :amount, :integer, default: 0
  end
end

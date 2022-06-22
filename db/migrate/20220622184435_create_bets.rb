class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.references :user, index: true
      t.references :main_cause, index: true
      t.references :sub_cause, index: true
      t.string :timeframe
      t.timestamps
    end
  end
end

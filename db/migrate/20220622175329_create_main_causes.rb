class CreateMainCauses < ActiveRecord::Migration[7.0]
  def change
    create_table :main_causes do |t|
      t.string :title
      t.text :description
      t.integer :count, default: 0
      t.timestamps
    end
  end
end

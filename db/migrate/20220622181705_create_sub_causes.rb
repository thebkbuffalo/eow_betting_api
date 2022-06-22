class CreateSubCauses < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_causes do |t|
      t.references :main_cause, index: true
      t.string :title
      t.text :description
      t.integer :count, default: 0
      t.timestamps
    end
  end
end

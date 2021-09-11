class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.integer :user_id
      t.integer :temperature
      t.boolean :condition
      t.string :remake

      t.timestamps
    end
  end
end

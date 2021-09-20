class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.integer :user_id
      t.float :temperature
      t.boolean :condition, default: true, null: false
      t.string :remark

      t.timestamps
    end
  end
end

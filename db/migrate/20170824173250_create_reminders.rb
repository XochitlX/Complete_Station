class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.references :treatment, foreign_key: true
      t.string :control
      t.string :control_missing 
      
      t.timestamps
    end
  end
end

class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.datetime :start_day_treatment
      t.integer :days_of_treatment

      t.timestamps
    end
  end
end

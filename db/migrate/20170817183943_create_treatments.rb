class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.references :user, foreign_key: true
      t.references :medicine, foreign_key: true
      t.references :period, foreign_key: true

      t.integer :dose_every
      t.integer :start_hour

      t.timestamps
    end
  end
end

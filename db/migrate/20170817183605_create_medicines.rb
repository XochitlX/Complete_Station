class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
      t.string :name
	  t.string :unit_measurement
	  t.string :presentation_to_take

      t.timestamps
    end
  end
end

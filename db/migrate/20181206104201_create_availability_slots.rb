class CreateAvailabilitySlots < ActiveRecord::Migration[5.2]
  def change
    create_table :availability_slots do |t|
      t.datetime :start_time
      t.integer :duration
      t.references :resource, index: true
      t.references :teacher, index: true

      t.timestamps
    end
  end
end

class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.references :establishment, index: true
      t.references :teacher, index: true
      t.references :resource, index: true
      t.references :sub_category, index: true

      t.timestamps
    end
  end
end

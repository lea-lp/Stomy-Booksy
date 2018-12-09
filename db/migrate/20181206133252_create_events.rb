class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.integer :duration
      t.references :student, foreign_key: true, index: true
      t.references :teacher, foreign_key: true, index: true
      t.references :resource, foreign_key: true, index: true

      t.timestamps
    end
  end
end

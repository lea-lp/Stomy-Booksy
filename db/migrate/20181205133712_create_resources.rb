class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :resource_type
      t.string :name
      t.text :description
      t.boolean :is_active
      t.belongs_to :establishment, index: true

      t.timestamps
    end
  end
end

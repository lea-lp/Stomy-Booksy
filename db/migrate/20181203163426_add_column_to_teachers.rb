class AddColumnToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
    add_column :teachers, :siret, :string
    add_column :teachers, :description, :text
    add_column :teachers, :phone, :string
    add_column :teachers, :address, :text
  end
end

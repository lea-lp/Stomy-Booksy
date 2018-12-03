class AddColumnToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :phone, :string
    add_column :students, :adress, :text
  end
end

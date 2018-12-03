class AddColumnToEstablishments < ActiveRecord::Migration[5.2]
  def change
    add_column :establishments, :name, :string
    add_column :establishments, :siret, :string
    add_column :establishments, :description, :text
    add_column :establishments, :phone, :string
    add_column :establishments, :adress, :text
  end
end

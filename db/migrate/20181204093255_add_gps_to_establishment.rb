class AddGpsToEstablishment < ActiveRecord::Migration[5.2]
  def change
    add_column :establishments, :latitude, :float
    add_column :establishments, :longitude, :float
  end
end

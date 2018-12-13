class AddServicesToEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :teacher_id, :references
    remove_column :events, :resource_id, :references

    add_reference :events, :service_id, index: true

  end
end

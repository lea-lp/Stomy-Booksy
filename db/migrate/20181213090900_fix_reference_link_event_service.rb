class FixReferenceLinkEventService < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :service_id_id

    add_reference :events, :service, index: true
  end
end

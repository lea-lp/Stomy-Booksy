class AddReferenceToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :resource, index: true, foreign_key: true
  end
end

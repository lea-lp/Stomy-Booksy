class RemoveDurationFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :duration

  end
end

class DropJoinTableTeachersEstablishments < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :teachers, :establishments
  end
end

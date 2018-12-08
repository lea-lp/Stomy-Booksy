class UpdateForeignKey < ActiveRecord::Migration[5.2]
  def change
    # remove the old foreign_key
    remove_foreign_key :events, :resources
    remove_foreign_key :events, :students
    remove_foreign_key :events, :teachers

    # add an on_delete cascade
    add_foreign_key :events, :resources, on_delete: :cascade
    add_foreign_key :events, :students, on_delete: :cascade
    add_foreign_key :events, :teachers, on_delete: :cascade

  end
end

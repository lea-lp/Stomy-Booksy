class JoinTableTeachersSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teachers, :sub_categories do |t|
      t.index [:teacher_id, :sub_category_id]
      t.index [:sub_category_id, :teacher_id]
    end
  end
end

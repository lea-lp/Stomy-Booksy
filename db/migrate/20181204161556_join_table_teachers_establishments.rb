class JoinTableTeachersEstablishments < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teachers, :establishments do |t|
      t.index [:teacher_id, :establishment_id], name: 'teacher_establishment'
      t.index [:establishment_id, :teacher_id], name: 'establishment_teacher'
    end
  end
end

class AddForeignKeyToEnrollments < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :enrollments, :courses, column: :course_id, on_delete: :cascade
    add_foreign_key :enrollments, :students, column: :student_id, on_delete: :cascade
    add_index :enrollments, :student_id
    add_index :enrollments, :course_id
  end
end

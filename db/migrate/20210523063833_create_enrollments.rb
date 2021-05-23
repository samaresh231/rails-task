class CreateEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
      t.bigint :course_id
      t.bigint :student_id
  
      t.timestamps
    end
  end
end

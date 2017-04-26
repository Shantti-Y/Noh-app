class CreateLessonLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_logs do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.integer :points,         default: 0
      t.datetime :lesson_date

      t.timestamps
    end
  end
end

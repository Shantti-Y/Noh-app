class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :lesson_log_id
      t.text :comment

      t.timestamps
    end
  end
end

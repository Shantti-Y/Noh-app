class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.datetime :event_date
      t.datetime :start_time
      t.string :title
      t.integer :lesson_id
      t.string :location

      t.timestamps
    end
  end
end

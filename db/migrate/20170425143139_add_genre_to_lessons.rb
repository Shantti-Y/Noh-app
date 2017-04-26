class AddGenreToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :genre, :string
  end
end

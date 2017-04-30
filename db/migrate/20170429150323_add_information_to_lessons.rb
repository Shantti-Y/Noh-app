class AddInformationToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :location, :string
    add_column :lessons, :characters, :string
  end
end

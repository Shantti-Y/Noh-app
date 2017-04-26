class AddStyleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :style, :string
  end
end

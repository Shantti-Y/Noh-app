class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :master_id          # Userの師匠が誰か
      t.integer :role               # Userが師匠か弟子か

      t.timestamps
    end
  end
end

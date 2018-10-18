class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :username, unique: true
      t.string :password_digest
      t.string :city
      t.string :country
      t.string :image_url
      t.integer :meeting_id, null: true

      t.timestamps
    end
  end
end

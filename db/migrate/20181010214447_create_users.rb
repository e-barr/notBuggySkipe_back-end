class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :city
      t.string :country
      t.string :image_url
      t.integer :meeting_id, null: true
      t.boolean :logged_in, default: false

      t.timestamps
    end
  end
end

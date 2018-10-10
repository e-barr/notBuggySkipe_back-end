class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :invite
      t.integer :room_id, null: true
      t.text :content

      t.timestamps
    end
  end
end

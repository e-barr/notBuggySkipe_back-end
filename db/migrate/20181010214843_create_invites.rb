class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :room_id
      t.text :content

      t.timestamps
    end
  end
end

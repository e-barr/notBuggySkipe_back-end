class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_1_id
      t.integer :user_2_id

      t.timestamps
    end
  end
end

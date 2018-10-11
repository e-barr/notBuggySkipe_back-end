class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.user_1 :integer
      t.user_2 :integer

      t.timestamps
    end
  end
end

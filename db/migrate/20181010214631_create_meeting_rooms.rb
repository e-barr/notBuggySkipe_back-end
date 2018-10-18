class CreateMeetingRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :meeting_rooms do |t|
      t.string :name, unique: true
      t.integer :person_count, default: 0

      t.timestamps
    end
  end
end

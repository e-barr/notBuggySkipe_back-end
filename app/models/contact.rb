class Contact < ApplicationRecord
  belongs_to :user_1, class_name: :User, foreign_key: :user_1_id
  belongs_to :user_2, class_name: :User, foreign_key: :user_2_id
  validates :user_1_id, presence: true
  validates :user_2_id, presence: true

  def self.make_new_contact(user_1_id, user_2_id)
    if user_1_id == user_2_id
      return
    else
      found_contact = User.find(user_1_id)
      found_contact2 = User.find(user_2_id)

      if found_contact && found_contact2
        Contact.create(user_1_id: user_1_id, user_2_id: user_2_id)
        Contact.create(user_1_id: user_2_id, user_2_id: user_1_id)
      end
    end
  end

  def self.delete_contact(id)
    found_contact = Contact.all.find { |contact| contact.id == id }

    second_contact = Contact.all.select{ |contact| contact.user_1 == found_contact.user_2 && contact.user_2 == found_contact.user_1 }.first

    found_contact.destroy
    second_contact.destroy
  end
end

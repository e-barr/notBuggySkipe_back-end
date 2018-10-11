class Contact < ApplicationRecord
  belongs_to :user_1, class_name: :User, foreign_key: :user_1_id
  belongs_to :user_2, class_name: :User, foreign_key: :user_2_id
  validates :user_1_id, presence: true
  validates :user_2_id, presence: true

  def self.make_new_contact(user_1_id, user_2_id)
    if user_1_id == user_2_id
      return
    else
      found_contact = Contact.all.select { |contact| contact.user_1_id == user_1_id && contact.user_2_id == user_2_id }

      unless found_contact.length == 1
        Contact.create(user_1_id: user_1_id, user_2_id: user_2_id)
        Contact.create(user_1_id: user_2_id, user_2_id: user_1_id)
      end
    end
  end
end

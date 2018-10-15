# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MeetingRoom.destroy_all
Invite.destroy_all
Contact.destroy_all
User.destroy_all


user1 = User.create(email: "user1@email.com", username: "user1", password: "password1", city: "New York", country: "USA", image_url: "https://cdn0.iconfinder.com/data/icons/PRACTIKA/256/user.png")
user2 = User.create(email: "user2@email.com", username: "user2", password: "password2", city: "San Francisco", country: "USA", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/768px-User_icon_2.svg.png")
user3 = User.create(email: "user3@email.com", username: "user3", password: "password3", city: "Chicago", country: "USA", image_url: "https://cdn2.iconfinder.com/data/icons/rcons-users-color/32/girl-512.png")

mr_1 = MeetingRoom.create(name: "room1")
mr_2 = MeetingRoom.create(name: "room2")
mr_3 = MeetingRoom.create(name: "room3")

invite1and2 = Invite.create(sender_id: user1.id, receiver_id: user2.id, room_id: mr_1.id, content: 'Meeting at 2pm in "room1"')
invite2and3 = Invite.create(sender_id: user2.id, receiver_id: user3.id, room_id: mr_2.id, content: 'Greetings')
invite3and1 = Invite.create(sender_id: user3.id, receiver_id: user1.id, room_id: mr_3.id, content: 'Let\'s get cookies')

contact1and2 = Contact.make_new_contact(user1.id, user2.id)
contact2and3 = Contact.make_new_contact(user2.id, user3.id)

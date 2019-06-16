# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'chief@test.com', password: '123456', password_confirmation: '123456', name: 'Joseph', role: 'chief_editor');
User.create(email: 'writer@test.com', password: '123456', password_confirmation: '123456', name: 'Will', role: 'writer');
User.create(email: 'reviewer@test.com', password: '123456', password_confirmation: '123456', name: 'Susan', role: 'writer');
User.create(email: 'writer2@test.com', password: '123456', password_confirmation: '123456', name: 'Matt', role: 'writer');
User.create(email: 'reviewer2@test.com', password: '123456', password_confirmation: '123456', name: 'Finn', role: 'writer');
User.create(email: 'writer3@test.com', password: '123456', password_confirmation: '123456', name: 'Joe', role: 'writer');
User.create(email: 'reviewer3@test.com', password: '123456', password_confirmation: '123456', name: 'Doe', role: 'writer');
Story.create(headline: 'headline 1', body: 'body text example ipsum', status: 'published' , creator_id: 1, writer_id: 2, reviewer_id: 3);
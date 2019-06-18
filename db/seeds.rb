# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: 'chief_editor', super_admin: true)
Role.create(name: 'writer', super_admin: false)
Status.create(name: 'unassigned')
Status.create(name: 'draft')
Status.create(name: 'for_review')
Status.create(name: 'in_review')
Status.create(name: 'pending')
Status.create(name: 'approved')
Status.create(name: 'published')
Status.create(name: 'archived')
Organization.create(name: 'Company 1', slug: 'cpn1')
Organization.create(name: 'Company 2', slug: 'cpn2')
User.create(email: 'chief@test.com', 1password: '123456', password_confirmation: '123456', name: 'Joseph', role_id: 1, organization_id: 1);
User.create(email: 'writer@test.com', password: '123456', password_confirmation: '123456', name: 'Will', role_id: 2, organization_id: 1);
User.create(email: 'reviewer@test.com', password: '123456', password_confirmation: '123456', name: 'Susan', role_id: 2, organization_id: 1);
User.create(email: 'chief2@test.com', password: '123456', password_confirmation: '123456', name: 'Josepho', role_id: 1, organization_id: 2);
User.create(email: 'writer2@test.com', password: '123456', password_confirmation: '123456', name: 'Matt', role_id: 2, organization_id: 2);
User.create(email: 'reviewer2@test.com', password: '123456', password_confirmation: '123456', name: 'Finn', role_id: 2, organization_id: 2);
User.create(email: 'writer3@test.com', password: '123456', password_confirmation: '123456', name: 'Joe', role_id: 2, organization_id: 2);
User.create(email: 'reviewer3@test.com', password: '123456', password_confirmation: '123456', name: 'Doe', role_id: 2, organization_id: 2);

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all
Teacher.destroy_all
Establishment.destroy_all

10.times do
  Student.create(phone:Faker::IDNumber.valid,email:Faker::Internet.free_email, first_name:Faker::DragonBall.character, last_name:Faker::Cat.name,password:"azerty",adress:Faker::Address.full_address)
end

10.times do
  Teacher.create(phone:Faker::IDNumber.valid,email:Faker::Internet.email, first_name:Faker::FunnyName.name, last_name:Faker::Cat.name,password:"azerty",adress:Faker::Address.full_address, siret:Faker::Device.serial, description:Faker::ChuckNorris.fact)
end

10.times do
  Establishment.create(phone:Faker::IDNumber.valid,email:Faker::Internet.safe_email, name:Faker::Device.platform, siret:
Faker::Device.serial,password:"azerty",adress:Faker::Address.full_address, description:Faker::ChuckNorris.fact)
end
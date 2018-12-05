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
Category.destroy_all
SubCategory.destroy_all

Category.create(title:"Musique")
Category.create(title:"Sport")

music = ["Piano", "Flûte", "Accordéon", "Guitare", "Trombone"]
sport = ["Football", "Handball", "Tennis", "Danse", "Rugby"]

address = ["31 Rue Caizergues de Pradines 34000 Montpellier", "31 Rue de l'Université 34000 Montpellier", "28 Rue du Faubourg Figuerolles 34070 Montpellier","18 Rue Fouques 34000 Montpellier", "1603 Avenue de la Pompignane 34000 Montpellier" ,"Place Eugène Bataillon 34095 Montpellier", "99 Avenue d'Occitanie 34090 Montpellier", "Route de Sète 34430 Saint-Jean-de-Védas", "390 Route de Pérols 34970 Lattes"]

5.times do |i|
  SubCategory.create(title:music[i], category_id:Category.first.id)
end

5.times do |i|
  SubCategory.create(title:sport[i], category_id:Category.last.id)
end

10.times do
  Student.create(phone:Faker::IDNumber.valid,email:Faker::Internet.free_email, first_name:Faker::DragonBall.character, last_name:Faker::Cat.name,password:"azerty",address:Faker::Address.full_address)
end

10.times do
  Teacher.create(phone:Faker::IDNumber.valid,email:Faker::Internet.email, first_name:Faker::FunnyName.name, last_name:Faker::Cat.name,password:"azerty",address:Faker::Address.full_address, siret:Faker::Device.serial, description:Faker::ChuckNorris.fact)
end
Teacher.all.each do |teacher|
  rand_array_sub_cat = (SubCategory.first.id..SubCategory.last.id).to_a.shuffle

  2.times do |i|
    teacher.sub_categories << SubCategory.find(rand_array_sub_cat[i])
# 20.times do
  # Teacher.find(rand(Teacher.first.id..Teacher.last.id)).sub_categories << SubCategory.find(rand(SubCategory.first.id..SubCategory.last.id))
  end
end


Establishment.create(phone:"04 34 11 02 25",email:"contact@lanacrouse.fr", name:"L'Anacrouse", password:"sylvain", address:"5 Place du Petit Scel 34000 Montpellier",description:"Centre d'expression artistique et culturel",siret:"80043065400015")

9.times do |i|
  Establishment.create(phone:Faker::IDNumber.valid,email:Faker::Internet.safe_email, name:Faker::Device.platform, siret:
Faker::Device.serial,password:"azerty",address:address[i], description:Faker::ChuckNorris.fact)
end


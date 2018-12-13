Student.destroy_all
Teacher.destroy_all
Establishment.destroy_all
Category.destroy_all
SubCategory.destroy_all
Resource.destroy_all
Service.destroy_all

Category.create(title:"Musique")
Category.create(title:"Sport")

music = ["Piano", "Flûte", "Accordéon", "Guitare", "Trombone", "Harpe", "Pipo", "Contrebasse", "Banjo", "Didgeridoo", "Tuba", "Triangle", "Balafon"]
sport = ["Football", "Handball", "Tennis", "Danse", "Rugby", "Danse classique", "Ultimate", "Coutûre acrobatique", "Dressage de loutre", "Tire aux mouettes", "Chasse aux escargots", "Serge lama training", ""]
address = ["31 Rue Caizergues de Pradines 34000 Montpellier", "31 Rue de l'Université 34000 Montpellier", "28 Rue du Faubourg Figuerolles 34070 Montpellier","18 Rue Fouques 34000 Montpellier", "1603 Avenue de la Pompignane 34000 Montpellier" ,"Place Eugène Bataillon 34095 Montpellier", "99 Avenue d'Occitanie 34090 Montpellier", "Route de Sète 34430 Saint-Jean-de-Védas", "390 Route de Pérols 34970 Lattes", "3 rue Rhin et Danube 34000 Montpellier", "195 boulevard de l'aéroport international 34000 Montpellier", "6 rue Jacques d'Aragon 34000 Montpellier", "1 rue Joubert 34000 Montpellier", "9 rue de Valfère 34000 Montpellier"]

5.times do |i|
  puts SubCategory.create(title:music[i], category_id:Category.first.id)
  puts SubCategory.create(title:sport[i], category_id:Category.last.id)
end
puts "*"*50
puts "sub-categories created"
puts "*"*50

10.times do |i|
  firstName = Faker::Name.first_name
  lastName = Faker::Name.last_name
  puts temp_stud = Student.create(phone:Faker::IDNumber.valid, first_name: firstName, last_name: lastName, password:"azerty", email: firstName+"."+lastName+"@gmail.com", address:Faker::Address.full_address)
  # temp_stud.avatar.attach(io: File.open("app/assets/images/profile_pictures/students/student_"+i.to_s+".jpg"), filename: 'avatar')
end
puts "*"*50
puts "students created"
puts "*"*50

20.times do |i|
  firstName = Faker::Name.first_name
  lastName = Faker::Name.last_name
  puts temp_teach = Teacher.create(phone:Faker::IDNumber.valid, email: firstName+"."+lastName+"@gmail.com", first_name: firstName, last_name: lastName, password:"azerty",address: Faker::Address.full_address, siret:Faker::Company.french_siren_number, description:Faker::ChuckNorris.fact)
  # temp_teach.avatar.attach(io: File.open("app/assets/images/profile_pictures/teachers/teacher_"+i.to_s+".jpg"), filename: 'avatar')
end
puts "*"*50
puts "teachers created"
puts "*"*50


Teacher.all.each_with_index do |teacher, ind|
  if ind%2 == 0 #To make sure an establishment only has Sport OR Music activities
    rand_array_sub_cat = Category.first.sub_categories.shuffle
  else
    rand_array_sub_cat = Category.last.sub_categories.shuffle
  end

  2.times do |i|
   puts teacher.sub_categories << rand_array_sub_cat[i]
  end
end
puts "*"*50
puts "teachers linked to sub-categories"
puts "*"*50

puts Establishment.create(phone:"04 34 11 02 25",email:"contact@lanacrouse.fr", name:"L'Anacrouse", password:"sylvain", address:"5 Place du Petit Scel 34000 Montpellier",description:"Centre d'expression artistique et culturel",siret:"80043065400015")

13.times do |i|
  estab_name = Faker::GreekPhilosophers.name
  puts temp_esta = Establishment.create(phone:Faker::IDNumber.valid,email: "contact@"+estab_name+".com", name: estab_name, siret:Faker::Company.french_siren_number,password:"azerty",address:address[i], description:Faker::Company.catch_phrase)
  temp_esta.avatar.attach(io: File.open("app/assets/images/profile_pictures/establishments/establishment_"+i.to_s+".jpg"), filename: 'avatar')
end
puts "*"*50
puts "Establishments created"
puts "*"*50


Establishment.all.each do |establishment|
  rand_array_teach = (Teacher.first.id..Teacher.last.id).to_a.shuffle
  4.times do |i|
    puts Resource.create(name: Faker::Cat.unique.name, resource_type: "salle", description: Faker::GreekPhilosophers.quote, establishment_id: establishment.id)
  end
  Faker::UniqueGenerator.clear
end
puts "*"*50
puts "Resources created and linked to Establishments"
puts "*"*50

Establishment.all.each_with_index do |establishment, ind|
  if ind%2 == 0 #To make sure an establishment only has Sport OR Music activities
    rand_array_sub_cat = Category.first.sub_categories.shuffle
  else
    rand_array_sub_cat = Category.last.sub_categories.shuffle
  end

  5.times do |i|
    sub_cat = rand_array_sub_cat[i]
    teacher = sub_cat.teachers.shuffle[0]
    puts Service.create(name: "Cours de "+sub_cat.title, description: "Apprends le "+sub_cat.title+" avec notre prof! "+Faker::Lorem.question, duration: 900*i, establishment: establishment, teacher: teacher, resource: establishment.resources.shuffle[0], sub_category: sub_cat)
  end

  if ind > 4 #we stop after 4 establishments
    break
  end
end
puts "*"*50
puts "services created and linked to Establishments"
puts "*"*50
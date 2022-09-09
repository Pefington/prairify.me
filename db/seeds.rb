require 'uri'
require 'unsplash'

User.create(email: 'admin@admin.com', password: 'adminpassword', role: User.roles[:admin])

10.times do 
  User.create!(email: Faker::Internet.safe_email, password: Faker::Internet.password(min_length: 6))
end

gardens = Unsplash::Photo.search('garden', 1, 20)
users = User.all
5.times do |index|
  Project.create!(user: users.sample, name:Faker::Lorem.word, description: Faker::Lorem.sentence(word_count: 10) ,begin: Faker::Date.between(from: Date.today, to: '2022-12-31'),finish:Faker::Date.between(from: '2023-01-01', to: '2023-12-31'))
  file = URI.open(gardens[index].urls.regular)
  Project.last.photos.attach(io: file, filename: 'garden-image.jpg')
end

projects = Project.all
plants = [61905, 51876, 47853, 53438, 47603, 50829, 47561, 48177, 126844, 48891, 60001]
30.times do
  Plant.create!(inaturalist_id: plants.sample, project: projects.sample)  
end

50.times do 
  Like.create(user: users.sample, project: projects.sample)
end

20.times do
  Favourite.create(user: users.sample, project: projects.sample)
end

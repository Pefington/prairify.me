require 'uri'
require 'unsplash'


User.create(email: 'admin@admin.com', password: 'adminpassword', role: User.roles[:admin])

10.times do
  User.create!(email: Faker::Internet.safe_email, password: Faker::Internet.password(min_length: 6),
               username: Faker::Name.first_name)
end

gardens = Unsplash::Photo.search('garden', 1, 20)
users = User.all
number_of_projects = 5
number_of_projects.times do |index|
  project = Project.new(user: users.sample,
                        name: Faker::Lorem.word,
                        description: Faker::Lorem.sentence(word_count: 10),
                        begin: Faker::Date.between(from: Time.zone.today, to: '2022-12-31'),
                        finish: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
                        place_name: Faker::Address.city,
                        country: Faker::Address.country)
  file = URI.parse(gardens[index].urls.regular).open
  project.photos.attach(io: file, filename: 'garden-image.jpg')
  project.save!
end
projects = Project.all

place = QueryApi.get_place_with_name('san marino')
plants = QueryApi.get_taxa_from_place_id(place[1])

30.times do
  plant = plants.sample
  Plant.create(inaturalist_id: plant[:id],
                common_name: plant[:common_name],
                english_name: plant[:english_name],
                scientific_name: plant[:scientific_name],
                wiki: plant[:wiki],
                picture_url: plant[:picture_url],
                project: projects.sample)
end

50.times do
  Like.create(user: users.sample, project: projects.sample)
end

20.times do
  Favourite.create(user: users.sample, project: projects.sample)
end

10.times do |index|
  ProjectUpdate.create!(project: projects.sample, title: Faker::Lorem.word,
                        description: Faker::Lorem.sentence(word_count: 10))
  file = URI.parse(gardens[number_of_projects + index].urls.regular).open
  ProjectUpdate.last.photo.attach(io: file, filename: 'garden-image.jpg')
end

50.times do
  Comment.create!(project: projects.sample, user: users.sample, content: Faker::Lorem.sentence(word_count: 5))
end

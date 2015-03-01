# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

city = City.create(
  name: 'Paris',
  country: 'France',
  geo_city_code: '6409'
)
city.save
city = City.create(
  name: 'Barcelona',
  country: 'Spain',
  geo_city_code: '3807'
)
city.save
city = City.create(
  name: 'Madrid',
  country: 'Spain',
  geo_city_code: '3818'
)
city.save
city = City.create(
  name: 'Brussels',
  country: 'Belgium',
  geo_city_code: '3406'
)
city.save
city = City.create(
  name: 'Amsterdam',
  country: 'Belgium',
  geo_city_code: '3406'
)
city.save
50.times do
  city = City.create(
    name: Faker::Address.city,
    country: Faker::Address.country,
    geo_city_code: rand(9999).to_s
    )
  city.save
end


10.times do
  promoter = Promoter.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    city_id: rand(1..5),
    password: '11111111'
  )
  promoter.save
end

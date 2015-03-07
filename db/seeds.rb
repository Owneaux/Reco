# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

city = City.create(
  name: 'Amsterdam',
  country: 'Netherland',
  geo_city_code: '3406'
)
city.save

deal_type = DealType.create(
  name: '',
  description: '',
  commission: 0
  )
deal_type.save

30.times do
  promoter = Promoter.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    city_id: 1,
    password: '11111111'
  )
  promoter.save
end

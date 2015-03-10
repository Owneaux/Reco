# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end



# 30.times do
#   promoter = Promoter.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     phone: Faker::PhoneNumber.cell_phone,
#     password: '11111111'
#   )
#   promoter.save
# end

# 5.times do |i|
#   deal = Deal.create(
#     deal_type: 4,
#     promoter_id: 3,
#     business_id: 1,
#     referrals: rand(20..40),
#     created_at: rand((i + 3).day).ago
#     )
#   deal.save
# end


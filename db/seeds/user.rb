require 'faker'
require 'gimei'

User.create!(
  name: 'DevUser',
  nickname: 'DevUser',
  email: 'sample@example.com',
  password: 'password',
  url: 'http://example.com',
  location: 'ハワイ'
)

# users = []
# 500.times do |i|
#   users << User.new(
#     name: Faker::Name.initials,
#     display_name: Faker::Name.initials,
#     email: "example#{i}@example.com",
#     url: "http://example.com#{i}",
#     location: "location#{i}"
#   )
# end

# User.import(users)

require 'faker'
require 'gimei'

# NOTE: コールバックがあるのでバルクインサートは使わない
# test user
User.create!(
  name: 'DevUser',
  nickname: 'DevUser',
  email: 'zenqisample@example.com',
  password: 'password',
  profile: 'profile text',
  url: 'http://example.com',
  location: 'ハワイ'
)

50.times do |i|
  User.create!(
    name: Faker::Name.initials,
    nickname: Faker::Name.initials,
    email: "sample#{i + 1}@example.com",
    password: 'password',
    profile: "profile#{i + 1}",
    url: "http://example#{i + 1}.com",
    location: "location#{i + 1}"
  )
end

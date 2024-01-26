require 'faker'
require 'gimei'

# テストユーザ
# NOTE: コールバックがあるのでバルクインサートは使わない
User.create!(
  name: 'DevUser',
  nickname: 'DevUser',
  email: 'sample@example.com',
  password: 'password',
  profile: 'profile text',
  url: 'http://example.com',
  location: 'ハワイ'
)

50.times do |i|
  User.create!(
    name: Faker::Name.initials,
    nickname: Faker::Name.initials,
    email: "example#{i}@example.com",
    password: 'password',
    profile: "profile#{i}",
    url: "http://example#{i}.com",
    location: "location#{i}"
  )
end

users_id = User.pluck(:id)
test_user = User.find_by(email: 'sample@example.com')

arr_text_tags = ['tag1 tag2 tag3', 'tag2 tag3 tag4', 'tag4 tag5 tag6', 'tag5 tag6 tag7', 'tag7 tag8', 'tag8 tag9 tag10']

# NOTE: コールバックがあるのでバルクインサートは使わない
20.times do |i|
  Article.create!(
    user_id: test_user.id,
    text_tags: arr_text_tags.sample,
    title: "Article Title#{i}",
    content: "Article Content#{i}",
    private: [true, false].sample,
    status: [0, 10, 20].sample
  )
end

100.times do |i|
  Article.create!(
    user_id: users_id.sample,
    text_tags: arr_text_tags.sample,
    title: "Article Title#{i + 20}",
    content: "Article Content#{i + 20}",
    private: [true, false].sample,
    status: [0, 10, 20].sample
  )
end

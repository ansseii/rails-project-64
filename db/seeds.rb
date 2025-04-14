# frozen_string_literal: true

PostComment.delete_all
PostLike.delete_all
Post.delete_all
User.delete_all
Category.delete_all

admin = User.new(
  email: ENV.fetch('DUMMY_USER', nil),
  encrypted_password: Devise::Encryptor.digest(User, ENV.fetch('DUMMY_PASSWORD', nil))
)
admin.save!(validate: false)

user = User.new(
  email: 'example@test.com',
  encrypted_password: Devise::Encryptor.digest(User, 'dummy')
)
user.save!(validate: false)

categories = (1..5).map do
  category = Faker::Book.unique.title
  Category.create!(name: category) unless Category.find_by(name: category)
end

10.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(sentence_count: 20),
    creator_id: User.all.sample.id,
    category_id: categories.sample.id
  )
end

Post.find_each do |post|
  PostLike.create!(
    post_id: post.id,
    user_id: user.id
  )
end

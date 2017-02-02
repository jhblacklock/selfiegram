users = User.create([{ name: 'Jackson', email: 'jackson@faker.com' },
                     { name: 'William', email: 'william@faker.com' },
                     { name: 'Trey', email: 'trey@faker.com' }])
users.each do |user|
  others = User.where.not(email: user.email)
  user.follow(others.sample)

  20.times do |i|
    image = user.images.create(caption: Faker::Beer.name,
                               url: Faker::Fillmurray.image(false, "640", "640"))
    image.liked_by others.sample

    image.liked_by others.sample if i > 9
  end
end

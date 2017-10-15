5.times do
  user = User.create!(
    email: FFaker::Internet.email,
    nickname: FFaker::Name.name,
    password: FFaker::Internet.password(16)
  )

  3.times do
    user.messages << Message.new(text: FFaker::Lorem.sentence(5))
  end
end
User.all.each do |u|
  (1..3).to_a.sample.times do
    Vote.create(message: Message.order('random()').first, user: u)
  end
end

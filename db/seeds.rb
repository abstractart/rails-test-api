rand(5..10).times do
  user = User.new(
    email: FFaker::Internet.email,
    nickname: FFaker::Name.name,
    password: FFaker::Internet.password(16)
  )

  rand(5..10).times do
    user.messages << Message.new(text: FFaker::Lorem.sentence(5))
  end
  
  user.save
end

User.find_each do |u|
  rand(1..3).times do
    Vote.create(message: Message.order('random()').first, user: u)
  end
end

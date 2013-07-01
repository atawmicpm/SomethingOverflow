User.create(name: "Shiv", email: "shiv@kumar.com", password: "password")
User.create(name: "Phil", email: "phil@mispagel.com", password: "password")
User.create(name: "Paulette", email: "paulette@luftig.com", password: "password")
User.create(name: "Avanish", email: "avanish@giri.com", password: "password")
User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "password")
User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "password")
User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "password")
User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "password")
User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "password")
User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "password")

Question.create(title: "If you could recommend one personal product/accessory, what would it be?",
                content: Faker::Lorem.paragraph)
Question.create(title: "Anyone have suggestions on what SUV I should buy?",
                content: Faker::Lorem.paragraph)
Question.create(title: "Product for wet hair look?",
                content: Faker::Lorem.paragraph)
Question.create(title: "What are the new and upcoming trends in men's high fashion?",
                content: Faker::Lorem.paragraph)
Question.create(title: "Advice for buying a new peacoat",
                content: Faker::Lorem.paragraph)
Question.create(title: "Male Skin Care Products",
                content: Faker::Lorem.paragraph)
Question.create(title: "Best smartphone on the market today",
                content: Faker::Lorem.paragraph)
Question.create(title: "Looking to buy a banjo.  Which one should I get?",
                content: "I've been wanting to buy a banjo for the past few years and finally decided I'm going to do it. Probably don't want to spend more than $200.")
Question.create(title: "Looking to buy new speakers for my home. Any advice?",
                content: "Just got my new home entertainment system setup and am looking for the right pair of speakers. No price range in mind.")

Question.all.each do |question|
  user = User.find(rand(1..10))
  user.questions << question
end

30.times do
  Answer.create(url: "http://www.amazon.com/Plan-Toys-0553500-PlanToys-Construction/dp/B0015D2522/ref=sr_1_5?s=toys-and-games&ie=UTF8&qid=1372665952&sr=1-5&keywords=building+blocks", 
                content: Faker::Lorem.paragraph)
  sleep(5)
end

Answer.all.each do |answer|
  user = User.find(rand(1..10))
  question = Question.find(rand(1..9))
  user.answers << answer
  question.answers << answer
end

100.times do
  Comment.create(content: Faker::Lorem.sentence)
end

Comment.all.each do |comment|
  user = User.find(rand(1..10))
  answer = Answer.find(rand(1..30))
  user.comments << comment
  answer.comments << comment
end

question = Question.create(title: "What snowboard should I get?",
                           content: "My current board's almost 5 years old. It's time for an upgrade. I'm an intermediate boarder and mainly stay on the trails.")
user = User.find(1)
user.questions << question

answers = []
answers << Answer.create(url: "http://www.amazon.com/Paricon-SB1-110T-Sceptor-Snowboard/dp/B000JJZLQU/ref=sr_1_1?s=sporting-goods&ie=UTF8&qid=1372478903&sr=1-1&keywords=snowboard", 
                         content: "I'm an intermediate snowboarder, and this board's been great so far.")
answers << Answer.create(url: "http://www.amazon.com/Burton-1018856-Womens-Feather-Snowboard/dp/B005I70Z1O/ref=sr_1_4?s=sporting-goods&ie=UTF8&qid=1372478963&sr=1-4&keywords=snowboard", 
                        content: "Take it to the steeps or take it to the park. It'll work anywhere on the mountain.")
answers << Answer.create(url: "http://www.amazon.com/Burton-Clash-Snowboard/dp/B006VZW91Q/ref=sr_1_3?s=sporting-goods&ie=UTF8&qid=1372478980&sr=1-3&keywords=snowboard", 
                         content: "This is easily the best board I've ever owned. Smooth traversing. Comfortable ride.")
answers << Answer.create(url: "http://www.amazon.com/Burton-Chopper-Snowboard-Orange-topskin/dp/B00597UDZQ/ref=sr_1_14?s=sporting-goods&ie=UTF8&qid=1372478980&sr=1-14&keywords=snowboard", 
                         content: "Stiff board, which means you can pick up a ton of speed. Not so great for park, but great for all mountain.")
answers << Answer.create(url: "http://www.amazon.com/Process-Flying-Snowboard-Mens-Burton/dp/B005I726QG/ref=sr_1_2?s=sporting-goods&ie=UTF8&qid=1372478980&sr=1-2&keywords=snowboard", 
                         content: "My Mom had this board, and she seemed to like it. She's not very good, though, so...")

answers.each do |answer|
  user = User.find(rand(1..10))
  user.answers << answer
  question.answers << answer
end

comments = []
comments << Comment.create(content: "I bought this board and I love it. Highly recommended!")
comments << Comment.create(content: "Don't listen to this person. This board is awful!")
comments << Comment.create(content: "It'll get you where you're trying to go, but not the best buy for the price...")
comments << Comment.create(content: "This is definitely the best board I've ever bought. Buy it before it's gone!")
comments << Comment.create(content: "Booooo what a waste of money!!")
comments << Comment.create(content: "I bought this board and I love it. Highly recommended!")
comments << Comment.create(content: "Don't listen to this person. This board is awful!")
comments << Comment.create(content: "It'll get you where you're trying to go, but not the best buy for the price...")
comments << Comment.create(content: "This is definitely the best board I've ever bought. Buy it before it's gone!")
comments << Comment.create(content: "Booooo what a waste of money!!")
comments << Comment.create(content: "I bought this board and I love it. Highly recommended!")
comments << Comment.create(content: "Don't listen to this person. This board is awful!")
comments << Comment.create(content: "It'll get you where you're trying to go, but not the best buy for the price...")
comments << Comment.create(content: "This is definitely the best board I've ever bought. Buy it before it's gone!")
comments << Comment.create(content: "Booooo what a waste of money!!")

comments.each do |comment|
  user = User.find(rand(1..10))
  answer = answers.sample
  user.comments << comment
  answer.comments << comment
end

400.times do |n|
  user = User.find(rand(1..10))
  value = n.even? ? -1 : 1
  Vote.create(value: value, user_id: user.id, voteable_id: rand(1..35), voteable_type: 'Answer')
end

1000.times do |n|
  user = User.find(rand(1..10))
  value = n.even? ? -1 : 1
  Vote.create(value: value, user_id: user.id, voteable_id: rand(1..110), voteable_type: 'Comment')
end
User.create(name: "Foo Bar", email: "foo@bar.com", password: "password")
User.create(name: "Bar Foo", email: "bar@foo.com", password: "password")
User.create(name: "Foo Baz", email: "foo@baz.com", password: "password")

Question.create(title: "Recommend how I make sure my MVP is done before I hand off my project?",
                content: Faker::Lorem.paragraph)
Question.create(title: "If you could recommend one personal product/accessory, what would it be?",
                content: Faker::Lorem.paragraph)
Question.create(title: "Looking to buy a banjo.  Which one should I get?",
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
Question.create(title: "Looking to buy new speakers for my home. Any advice?",
                content: Faker::Lorem.paragraph)
Question.create(title: "What snowboard should I get?",
                content: Faker::Lorem.paragraph)

Question.all.each do |question|
  user = User.find(rand(1..3))
  user.questions << question
end

Answer.create(url: "http://www.amazon.com/Paricon-SB1-110T-Sceptor-Snowboard/dp/B000JJZLQU/ref=sr_1_1?s=sporting-goods&ie=UTF8&qid=1372478903&sr=1-1&keywords=snowboard", content: Faker::Lorem.paragraph)
Answer.create(url: "http://www.amazon.com/Burton-1018856-Womens-Feather-Snowboard/dp/B005I70Z1O/ref=sr_1_4?s=sporting-goods&ie=UTF8&qid=1372478963&sr=1-4&keywords=snowboard", content: Faker::Lorem.paragraph)
Answer.create(url: "http://www.amazon.com/Burton-Clash-Snowboard/dp/B006VZW91Q/ref=sr_1_3?s=sporting-goods&ie=UTF8&qid=1372478980&sr=1-3&keywords=snowboard", content: Faker::Lorem.paragraph)
Answer.create(url: "http://www.amazon.com/Burton-Chopper-Snowboard-Orange-topskin/dp/B00597UDZQ/ref=sr_1_14?s=sporting-goods&ie=UTF8&qid=1372478980&sr=1-14&keywords=snowboard", content: Faker::Lorem.paragraph)
Answer.create(url: "http://www.amazon.com/Process-Flying-Snowboard-Mens-Burton/dp/B005I726QG/ref=sr_1_2?s=sporting-goods&ie=UTF8&qid=1372478980&sr=1-2&keywords=snowboard", content: Faker::Lorem.paragraph)

Answer.all.each do |answer|
  user = User.find(rand(1..3))
  question = Question.first
  user.answers << answer
  question.answers << answer
end

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

Answer.create(url: "http://www.abc-of-snowboarding.com/images/content-images/article-unitysnowboards-1.gif", content: Faker::Lorem.paragraph)
Answer.create(url: "http://images.ccs.com/pi/65-05324/large/lib-tech-burtner-box-scratcher-btx-snowboard-mens", content: Faker::Lorem.paragraph)
Answer.create(url: "http://di1.shopping.com/images/pi/d0/de/db/31046502-200x200-0-0.jpg?p=p7.95a38750b00b7d0cd950&a=2&c=1&l=8055916&t=100108133712&r=1", content: Faker::Lorem.paragraph)
Answer.create(url: "http://images.ccs.com/pi/65-12117/large/burton-process-snowboard-custom-binding-pkg-mens", content: Faker::Lorem.paragraph)
Answer.create(url: "http://www.snowshedny.com/ProductImages/112524/c_6117249_burton-lux-snowboard-women-s-2013-139-front.jpg", content: Faker::Lorem.paragraph)

Answer.all.each do |answer|
  user = User.find(rand(1..3))
  question = Question.last
  user.answers << answer
  question.answers << answer
end

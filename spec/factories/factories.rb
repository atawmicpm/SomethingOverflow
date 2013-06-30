require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Internet.user_name }
    f.email { Faker::Internet.email }
    f.password 'password'
    f.password_confirmation 'password'
  end

  factory :question do
  	title "title"
  	content "this is the question content"
  	user
  end

  factory :answer do 
  	content "this is an answer"
  	url "http://www.amazon.com/Aurora-Plush-inches-Dreamy-Prancer/dp/B002PUD6RC/ref=sr_1_3?ie=UTF8&qid=1372550596&sr=8-3&keywords=horse"
  end

  factory :comment do 
    content "this is yet another awesome comment"
    user
    answer
  end

  factory :invalid_comment, parent: :comment do
  	content nil
  end

  factory :vote do
  	user
  	voteable_id 1
  	voteable_type 'Comment'
  	value 1
  end

end

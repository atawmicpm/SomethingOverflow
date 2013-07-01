require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Internet.user_name }
    f.email { Faker::Internet.email }
    f.password 'password'
    f.password_confirmation 'password'
  end

  factory :question do
    user
  	title "title"
  	content "this is the question content"
  end

  factory :invalid_question, parent: :question do
    title nil
    content nil
  end

  factory :answer do 
  	content "this is an answer"
  	url "http://www.amazon.com/Beanie-Boos-Julep-Monkey-Heart/dp/B005XH7L2K/ref=sr_1_3?s=toys-and-games&ie=UTF8&qid=1372640601&sr=1-3&keywords=heart"
    question
  end

  factory :answer_duplicate, parent: :answer do
    content "this is an answer"
    url "http://www.amazon.com/Beanie-Boos-Julep-Monkey-Heart/dp/B005XH7L2K/ref=sr_1_3?s=toys-and-games&ie=UTF8&qid=1372640601&sr=1-3&keywords=heart"
    question
  end  

  factory :invalid_answer, parent: :answer do
    url nil
    user
    question
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

  factory :invalid_vote, parent: :vote do
    voteable_type 
    voteable_id
  end

  factory :updated_vote, parent: :vote do
    value -1
  end
end

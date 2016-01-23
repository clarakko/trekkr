require 'rails_helper'
require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "snusmumriken#{n}" }
    sequence(:email) { |n| "snusmumriken#{n}@mumintroll.com" }
    password 'password'
    password_confirmation 'password'
  end
end

FactoryGirl.define do
  factory :challenge do
    sequence(:title) { |n| "Crazy Challenge #{n}" }
    tagline 'Do this crazy, crazy thing!'
    description 'This challenge is pure craziness! \n
      Get out there and do this thing! Your lungs will thank you'
  end
end

FactoryGirl.define do
  factory :trek do
    sequence(:title) { |n| "Doable Trek #{n}" }
    location "Remote Mountains, NH"
    description "This trek is pure awesome! \n
    Go do this trek, have the time of your life!"
  end
end

FactoryGirl.define do
  factory :step do
    challenge
    trek
  end
end

FactoryGirl.define do
  factory :report do
    start_date DateTime.new(2015, 05, 12)
    report 'This is a trail report!'
    association :user, factory: :user
    association :trek, factory: :trek
  end
end

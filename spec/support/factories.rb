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
    start_date Time.zone.parse("2015-05-12 08:00")
    report 'This is a trail report!'
    association :user, factory: :user
    association :trek, factory: :trek

    factory :public_report do
      public true
    end

    factory :full_report do
      end_date Time.zone.parse("2015-05-12 10:00")
      duration "02:00"
      distance 6
      weather "Sunny and balmy"
      conditions "Trail was perfect"
      difficulty 6
      public true
      report "Could not have been a better hike!"
    end
  end
end

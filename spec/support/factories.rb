require 'rails_helper'
require 'faker'

FactoryGirl.define do
  factory :user do
    username 'snusmumriken'
    email 'snusmumriken@mumintroll.com'
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

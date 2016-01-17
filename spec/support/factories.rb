require 'rails_helper'

FactoryGirl.define do
  factory :user do
    username 'snusmumriken'
    email 'snusmumriken@mumintroll.com'
    password 'password'
    password_confirmation 'password'
  end
end

require 'factory_girl_rails'
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
    role 'user'
   end
end

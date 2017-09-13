require 'factory_girl_rails'
FactoryGirl.define do
  factory :review do
    review 'da bestest thing on urf'
    user
    album 
    rating 5
  end
end

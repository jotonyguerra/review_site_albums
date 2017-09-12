require 'factory_girl_rails'
FactoryGirl.define do
  factory :reviw do
    review 'da bestest thing on urf'
    user_id 1
    album_id 1
    rating 5
  end
end

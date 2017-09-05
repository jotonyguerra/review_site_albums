require 'factory_girl_rails'
FactoryGirl.define do
  factory :track do
    name ""
    length 1
    album nil
  end
end

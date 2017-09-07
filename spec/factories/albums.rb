require 'factory_girl_rails'
FactoryGirl.define do
  factory :album do
    title 'Abbey Road'
    artist 'Beatles'
    release_year 1969
  end
end

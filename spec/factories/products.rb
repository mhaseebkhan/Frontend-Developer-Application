require 'faker'

FactoryGirl.define do
  factory :product do |f|
    f.name { Faker::Name.name }
    f.price { rand(10) }
    f.product_type { Faker::Lorem.words(1) }
  end
end
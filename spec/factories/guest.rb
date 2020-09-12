FactoryGirl.define do
  factory :guest do
    sequence(:name) { Faker::Name.name }
    sequence(:phone) { Faker::PhoneNumber }
    sequence(:email) { Faker::Internet.email }
  end
end

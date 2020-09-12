FactoryGirl.define do
  factory :employee do
    sequence(:name) { |n| "#{Faker::Name} #{n}" }
    sequence(:phone) { Faker::PhoneNumber }
    sequence(:office) { Faker::Name }
  end
end

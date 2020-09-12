FactoryGirl.define do
  factory :meals_use do
    association :booking, factory: :booking
    association :meal, factory: :meal
    sequence(:used_at) { Faker::Date.between(booking.check_in, booking.check_out) }
  end
end

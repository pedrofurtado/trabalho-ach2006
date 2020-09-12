FactoryGirl.define do
  factory :services_use do
    association :booking, factory: :booking
    sequence(:service) { booking.rooms.first.services.first }
    sequence(:used_at) { Faker::Date.between(booking.check_in, booking.check_out) }
  end
end

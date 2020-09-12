FactoryGirl.define do
  factory :courtesies_use do
    association :booking, factory: :booking
    sequence(:courtesy) { FactoryGirl.create :courtesy, services: booking.rooms.map(&:services).flatten }
    sequence(:used_at) { Faker::Date.between(booking.check_in, booking.check_out) }
  end
end

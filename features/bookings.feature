Feature: Bookings
As a User
I want to manage bookings in Hotel
So that I have a complete experience and better booking management

@create_booking_guest_limit_exceded
Scenario: Create a new booking with more companions than the room guest_limit
Given I am logged
And Exists a room with 5 guest limit
When I go to the new booking page
And I fill the booking form with 5 companions and submit
Then I will see a guest limit exceded error

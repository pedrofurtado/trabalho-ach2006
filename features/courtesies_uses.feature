Feature: Courtesies Uses
As a User
I want to manage courtesies uses in Hotel
So that I have a complete experience and better management

Scenario: Creating a new Courtesy Use
Given I am logged
When I go to the new courtesy use page
When I fill the courtesy use form and submit
Then I go to the courtesies uses page
Then I will see a success message courtesy use
Then I will have the new courtesy use created in database

Scenario: Editing a Courtesy Use
Given I am logged
When I go to the edit page of a courtesy use
When I fill the courtesy use form and submit
Then I go to the courtesy use page
Then I will see a success message of updating courtesy use
Then I will have the courtesy use updated in database

Scenario: Showing a Courtesy Use
Given I am logged
When I go to the show page of a courtesy use
Then I want to see the informations about courtesy use

Scenario: Destroying a Courtesy Use
Given I am logged
When I go to the index page of courtesies uses
When I click on destroy courtesy use button
Then I am redirected again to index page of courtesies uses
Then I see a success message of destroying courtesy use
Then I destroy the courtesy use from database

Scenario: Indexing the Courtesies Uses
Given I am logged
When I go to the index page of all courtesies uses
Then I want to see the informations about all courtesies uses

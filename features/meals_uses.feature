Feature: Meals Uses
As a User
I want to manage meals uses in Hotel
So that I have a complete experience and better management

Scenario: Creating a new Meal Use
Given I am logged
When I go to the new meal use page
When I fill the meal use form and submit
Then I go to the meals uses page
Then I will see a success message of meal_use
Then I will have the new meal use created in database

Scenario: Editing a Meal Use
Given I am logged
When I go to the edit page of a meal use
When I fill the meal use form and submit
Then I go to the meal use page
Then I will see a success message of meal_use updating
Then I will have the meal use updated in database

Scenario: Showing a Meal Use
Given I am logged
When I go to the show page of a meal use
Then I want to see the informations about meal use

Scenario: Destroying a Meal Use
Given I am logged
When I go to the index page of meals uses
When I click on destroy meal_use button
Then I am redirected again to index page of meals uses
Then I see a success message of meal_use destroying
Then I destroy the meal use from database

Scenario: Indexing the Meals Uses
Given I am logged
When I go to the index page of all meals uses
Then I want to see the informations about all meals uses

Feature: Environments Uses
As a User
I want to manage environments uses in Hotel
So that I have a complete experience and better management

Scenario: Creating a new Environments Use
Given I am logged
When I go to the new environment use page
When I fill the environment use form and submit
Then I go to the environments uses page
Then I will see a success message of environment created
Then I will have the new environment use created in database

Scenario: Editing a Environments Use
Given I am logged
When I go to the edit page of a environment use
When I fill the environment use form and submit
Then I go to the environment use page
Then I will see a success message of environments use of updating
Then I will have the environment use updated in database

Scenario: Showing a Environments Use
Given I am logged
When I go to the show page of a environment use
Then I want to see the informations about environment use

Scenario: Destroying a Environments Use
Given I am logged
When I go to the index page of environments uses
When I click on destroy button to destroy an environment
Then I am redirected again to index page of environments uses
Then I see a success message of destroying a environment
Then I destroy the environment use from database

Scenario: Indexing the Services Uses
Given I am logged
When I go to the index page of all environments uses
Then I want to see the informations about all environments uses

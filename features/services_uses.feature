Feature: Services Uses
As a User
I want to manage services uses in Hotel
So that I have a complete experience and better management

Scenario: Creating a new Service Use
Given I am logged
When I go to the new service use page
When I fill the service use form and submit
Then I go to the services uses page
Then I will see a success message
Then I will have the new service use created in database

Scenario: Editing a Service Use
Given I am logged
When I go to the edit page of a service use
When I fill the service use form and submit
Then I go to the service use page
Then I will see a success message of updating
Then I will have the service use updated in database

Scenario: Showing a Service Use
Given I am logged
When I go to the show page of a service use
Then I want to see the informations about service use

Scenario: Destroying a Service Use
Given I am logged
When I go to the index page of services uses
When I click on destroy button
Then I am redirected again to index page of services uses
Then I see a success message of destroying
Then I destroy the service use from database

Scenario: Indexing the Services Uses
Given I am logged
When I go to the index page of all services uses
Then I want to see the informations about all services uses

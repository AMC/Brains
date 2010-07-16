Feature: Manage tasks
  In order to complete a project
  As a productive employee
  I want to manage the tasks of the project
  
  Scenario: create a task
    Given |login|email|password|
          |Bob|Bob@willgretz.com|password|
    And I am Logged in as "bob" with password "secret"
    When I go to the new task page
    And I fill in "Name" with "Task 1"
    And I fill in "description" with "description 1"
    And I select "7" from "priority"
    Then I should see the following task
      |name|description|priority|
      |task 1|description 1|7|
  
  
  

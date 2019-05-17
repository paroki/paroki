Feature: Create user
  In order to manage user
  As an administrator
  I should able to create, edit, update, and delete user

  Background:


  Scenario: Successfully create user
    Given I have logged in as an administrator for paroki test
    And there are no user with username "some.paroki.user"
    When I send a JSON "POST" request to "/user" with body:
    """
    {
      "username": "some.paroki.user",
      "plainPassword": "password",
      "nama": "Some Paroki User Nama",
      "email": "some.paroki.user@example.org"
    }
    """
    Then the response status code should be 201
    And the JSON should be a superset of:
    """
    {
      "username": "some.paroki.user",
      "paroki": {
        "nama": "test"
      }
    }
    """

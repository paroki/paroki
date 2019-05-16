Feature: Security
  In order to using application
  As User
  I should able to access restricted page

  Scenario: Login to application
    Given there is an admin user with username admin
    When I send a JSON "POST" request to "/login-check" with body:
    """
    {
      "username": "admin",
      "password": "password"
    }
    """
    Then the response status code should be 200
    And the JSON node "token" should exist

  Scenario: Login with invalid password
    Given there is an admin user with username admin
    When I send a JSON "POST" request to "/login-check" with body:
    """
    {
      "username": "admin",
      "password": "bar"
    }
    """
    Then the response status code should be 401

  #@todo make this scenario working again
  #Scenario: Access restricted resource without login
  #  Given I send a JSON "GET" request to "/user"
  #  Then the response status code should be 401

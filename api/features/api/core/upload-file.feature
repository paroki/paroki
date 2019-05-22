Feature: File uploading

    Scenario: Successfully uploading a file
        Given I have logged in with username test
        And I add Accept header equal to "application/json"
        When I upload file "user.jpeg" with:
        | type  | user |
        | id    | test |
        Then the response status code should be 201

Feature: File uploading
    
    Scenario: Successfully uploading a file
        Given I have logged in with username test
        And I add Accept header equal to "application/json"
        When I upload file "user.jpeg" with:
        | type  | user |
        | id    | test |
        Then the response status code should be 201
        And the JSON should be a superset of:
        """
        {
            "id": "6D7D8495-9560-4CD8-91E2-22902D9A6F98"
        }
        """

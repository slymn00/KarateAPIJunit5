Feature: Config Demo
  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: demo
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
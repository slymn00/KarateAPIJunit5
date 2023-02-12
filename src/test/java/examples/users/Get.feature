Feature: Sample API GET test
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
  Scenario: Test a Sample Get API
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  Scenario:  path param scenario
    Given path '/users'
    And params '2'
    When  method GET
    And status 200
    And print response

  Scenario: real test
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.lenght == 6
    And match $.data[1].id == 8
    And match $.data[3].last_name = 'Fields'



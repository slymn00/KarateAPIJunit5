Feature: Sample API POST test
  Background:
    * url 'https://reqres.in/api/'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  Scenario: post req trying
    Then path 'users'
    When request {"name":"Suleyman","job":"Baba"}
    When method post
    Then status 201
    And match response == {"createdAt":"#ignore", "name":"Suleyman" , "id":"#string" , "job":"Baba"}
    And print response

  Scenario: post with read response file
    Then path 'users'
    When request {"name":"Suleyman","job":"Baba"}
    When method post
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  Scenario: post with read request body from file
    Then path 'users'
    When def requestBody = read("request1.json")
    When request requestBody
    When method post
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  Scenario: post with read change request body from file
    Then path 'users'
    When def reqBody = read("request1.json")
    And set reqBody.job = 'engineer'
    When request reqBody
    When method post
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

Feature: imdb rating control
  Background:
    * url baseOMDBUrl
    * header Accept = 'application/json'

  Scenario: control imdb rating
    Given param apikey = 'e7adebce'
    Given param s = 'Harry Potter'
    When  method GET
    Then status 200
    And print response
    When def title = response.Search[6].Title
    And match title == 'Harry Potter and the Deathly Hallows: Part 1'
    When def imdbID = response.Search[6].imdbID
    Given  param apikey = 'e7adebce'
    Given param i = imdbID
    When method GET
    Then status 200
    And print response
    And match title == response.Title
    And match response.imdbRating == '7.7'



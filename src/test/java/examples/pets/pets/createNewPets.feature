Feature: Create new pets

  Background:
    * url baseUrl
    * path 'pets'

  @create_successful_pet #tag
  Scenario: Create a new Dog
    Given request {"name": "Bingo3","type": "Perro","age": 1}
    And print "la url es: ", baseUrl
    And print "el apikey es: ", apiKey
    When method post
    Then status 201
    And match $.message contains "created"
    * def petId = $.data.id
      #And match response == {"status": "success","message": "Pet created","data": {"id": #number,"name": "#string","type": "Perro","age": 1}}

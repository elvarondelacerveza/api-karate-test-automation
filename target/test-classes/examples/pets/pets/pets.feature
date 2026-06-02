Feature: Create new pets

  Background:
    * url baseUrl
    * path 'pets'





  Scenario: Delete a Pet
    Given request {"name": "Bingo3","type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    And url "http://localhost:3000/pets/" + petId
    When method delete
    Then status 204

    # Crear Scenario Outline para datos validos e invalidos
  Scenario Outline: Create a new pet
    Given request {"name": "#(name)","type": "#(type)","age": #(parseInt(age))}
    And print "la url es: ", baseUrl
    And print "el apikey es: ", apiKey
    When method post
    Then status 201
    And match $.message contains "created"
    Examples:
      | name    | type  | age
      | Bluey   | Gato  | 1
      | Bluey 2 | Lobo  | 2
      | Bluey 3 | Loro  | 3
      | Bluey 4 | Oveja | 4
      | Bluey 5 | Morsa | 5

    #Description es un valor que viene de los examples
  Scenario Outline: Create a new pet with <description>
    Given request {"name": "<name>","type": "<type>","age": <age>}
    And print "la url es: ", baseUrl
    And print "el apikey es: ", apiKey
    When method post
    Then status <expectedStatus>
    And match $.message contains "<expectedMessage>"
    Examples:
      | name                      | type | age | description        | expectedStatus | expectedMessage
      | ashdaghsjkaksjdhashkdhasj | Gato | 1   | long name          | 201            | created
      | Bluey 2 <>                | Lobo | 2   | invalid characters | 201            | created

    #Control alt L para formatear

  Scenario: Create a new dog reading an external file
    * def createANewPetRequest = read('classpath:requests/createANewPet.json')
    * def succesfullPetCreationResponse = read('classpath:responses/successfulCreatePet.json')

    Given request createANewPetRequest
    And print "la url es: ", baseUrl
    And print "el apikey es: ", apiKey
    When method post
    Then status 201
    And match $.message contains "created"
    And match response == succesfullPetCreationResponse

  Scenario: Create a new dog reading an external file as template
    * def name = 'Testing'
    * def type = 'Perro'
    * def age = 1

    * def createANewPetRequest = read('classpath:requests/createANewPetTemplate.json')
    * def succesfullPetCreationResponse = read('classpath:responses/successfulCreatePet.json')

    * print createANewPetRequest

    Given request createANewPetRequest
    And print "la url es: ", baseUrl
    And print "el apikey es: ", apiKey
    When method post
    Then status 201
    And match $.message contains "created"
    And match response == succesfullPetCreationResponse
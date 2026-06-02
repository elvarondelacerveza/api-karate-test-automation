Feature: Search pets

  Scenario: Search a new Dog
   # Given request {"name": "Bingo3","type": "Perro","age": 1}
   # And method post
   # And status 201
   # And def petId = $.data.id
    * call read('createNewPets.feature@create_successful_pet')
    Given url "http://localhost:3000/pets/" + petId
    And method get
    Then status 200
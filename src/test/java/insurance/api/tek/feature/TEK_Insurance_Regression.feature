Feature: TEK Insurance Regression Suite

  Background:
    Given  url appUrl
    * def tokenGenerator = callonce read('generateToken.feature@GenerateToken')
    * def tokenValue = tokenGenerator.response.token
    * header Authorization = 'Bearer ' + tokenValue


    # Scenario: Post an account
  Scenario: Post an account - Primary Person
  * def generator = Java.type('insurance.api.tek.utility.DataGenerator')
  * def email = generator.getEmail()
  * def firstName = generator.getFirstName()
  * def lastName = generator.getLastName()
  * def title = generator.getTitle()
  * def employmentStatus = generator.getEmploymentStatus()
  * def dateOfBirth = generator.getDateOfBirth()
  * def maritalStatus = generator.getMaritalStatus()
  * def gender = generator.getGender()
  * path '/api/accounts/add-primary-account'
  * request
  """
  {
  "id": 0,
  "email": "#(email)",
  "firstName": "#(firstName)",
  "lastName": "#(lastName)",
  "title": "#(title)",
  "gender": "#(gender)",
  "maritalStatus": "#(maritalStatus)",
  "employmentStatus": "#(employmentStatus)",
  "dateOfBirth": "#(dateOfBirth)",
  "new": true
}
  """
  * method post
  * status 201
  * print response
    # Scenario: Post a car account
    # Scenario: update the car
    # Scenario: Delete the car

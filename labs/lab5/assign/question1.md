# cosc 304 lab 5 question 1 relational model

Owner (id {PK}, firstName, lastName, address)
Pet (name {PK}, *ownerId*, age, description)
    // ownerId is a FK to Owner
    Cat ()
    Dog ()
PetStay (startDate {PK}, *petName* {PK}, *ownerId* {PK}, endDate, cost)
    // petName is a FK to Pet, ownerId is a FK to Owner
Room (roomNumber {PK}, *buildingId* {PK}, buildingName, yearBuilt)
    // buildingId is a FK to Building
Building (buildingId {PK}, buildingName, yearBuilt)
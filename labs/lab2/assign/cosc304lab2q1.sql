DROP TABLE IF EXISTS Airplane;
DROP TABLE IF EXISTS Airport;
DROP TABLE IF EXISTS Flight;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS OnFlight;

CREATE TABLE Airplane (
	planeId VARCHAR(10),
	planeModel VARCHAR(20),
	planeManDate DATE,
	PRIMARY KEY (planeId)
);

CREATE TABLE Airport (
	airportId CHAR(5),
	airportName VARCHAR(30),
	airportCity VARCHAR(40),
	airportProvine VARCHAR(20),
	airportCountry VARCHAR(20),
	PRIMARY KEY (airportId)
);

CREATE TABLE Flight (
	flightNumber CHAR(5),
	departDate DATETIME,
	departAirport CHAR(5),
	arriveAirport CHAR(5),
	expectedArriveDateTime DATETIME,
	actualArriveDateTime DATETIME,
	planeId VARCHAR(10),
	FOREIGN KEY (planeId) REFERENCES Airplane(planeId)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);
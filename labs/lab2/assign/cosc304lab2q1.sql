DROP TABLE IF EXISTS OnFlight CASCADE;
DROP TABLE IF EXISTS Flight CASCADE;
DROP TABLE IF EXISTS Airplane CASCADE;
DROP TABLE IF EXISTS Airport CASCADE;
DROP TABLE IF EXISTS Passenger CASCADE;

CREATE TABLE Airplane (
	planeID VARCHAR(10),
	planeModel VARCHAR(20),
	planeManDate DATE,
	PRIMARY KEY (planeId)
);

CREATE TABLE Airport (
	airportID CHAR(5),
	airportName VARCHAR(30),
	airportCity VARCHAR(40),
	airportProvine VARCHAR(20),
	airportCountry VARCHAR(20),
	PRIMARY KEY (airportID)
);

CREATE TABLE Flight (
	flightNumber CHAR(5),
	departDate DATETIME,
	departAirport CHAR(5),
	arriveAirport CHAR(5),
	expectedArriveDateTime DATETIME,
	actualArriveDateTime DATETIME,
	planeID VARCHAR(10),
	PRIMARY KEY (flightNumber, departDate),
	FOREIGN KEY (planeId) REFERENCES Airplane(planeID)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

CREATE TABLE Passenger (
	passID INTEGER,
	passFirstName VARCHAR(30),
	passLastName VARCHAR(30),
	passBday DATE,
	passStreet VARCHAR(50),
	passCity VARCHAR(40),
	passProvince VARCHAR(20),
	passCountry VARCHAR(20),
	PRIMARY KEY (passID)
);

CREATE TABLE OnFlight (
	passID INTEGER,
	flightNumber CHAR(5),
	departDate DATETIME,
	seatNumber CHAR(4),
	PRIMARY KEY (seatNumber),
	FOREIGN KEY (passID) REFERENCES Passenger(passID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (flightNumber, departDate) REFERENCES Flight()
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

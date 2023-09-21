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
	airportCountry VARCHAR(20)
);

CREATE TABLE Flight (
	flightNumber CHAR(5),
	departDate DATETIME,
	departAirport CHAR(5),
	arriveAirport CHAR(5)
);
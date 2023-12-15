-- Database: MakeMyTrip

DROP DATABASE IF EXISTS MakeMyTrip;

CREATE DATABASE MakeMyTrip;

-- USE MakeMyTrip;
CREATE TABLE IF NOT EXISTS person
(
	name varchar(300) NOT NULL,
	phoneNo int not null,
	age INT not null,
	sex CHAR(1) NOT NULL,
	pincode int not null,
	DOB DATE NOT NULL,
	personID INT NOT NULL,
	PRIMARY KEY (personID)
);
CREATE TABLE IF NOT EXISTS superadmin
(
	personID INT NOT NULL,
	username varchar(20) NOT NULL,
	passkey varchar(20) NOT NULL,
	PRIMARY KEY (personID),
	foreign key (personID) references person(personID) on delete cascade
);
CREATE TABLE IF NOT EXISTS customer 
(
	personID INT NOT NULL,
	username varchar(20) NOT NULL,
	passkey varchar(20) NOT NULL,
	PRIMARY KEY (personID),
	foreign key (personID) references person(personID) on delete cascade
);
CREATE TABLE IF NOT EXISTS cities
(
	cityID INT NOT NULL,
	cityName VARCHAR(100) NOT NULL,
	pincode INT NOT NULL,
	state VARCHAR(100),
	country VARCHAR(100),
	PRIMARY KEY (cityID)
);
CREATE TABLE IF NOT EXISTS hotel
(
	hotelID INT NOT NULL,
	phoneNo INT,
	hotelName VARCHAR(200) NOT NULL,
	cityID INT NOT NULL,
	roomsLeft INT NOT NULL,
	roomCost INT NOT NULL,
	rating INT NOT NULL,
	PRIMARY KEY (hotelID),
	FOREIGN KEY (cityID) REFERENCES cities(cityID)on delete cascade
);
CREATE TABLE IF NOT EXISTS hotelAdmin 
(
	personID INT NOT NULL,
	hotelID INT NOT NULL,
	username varchar(20) NOT NULL,
	passkey varchar(20) NOT NULL,
	PRIMARY KEY (personID, hotelID),
	foreign key (personID) references person(personID) on delete cascade,
	foreign key (hotelID) references hotel(hotelID) on delete cascade
);
/*all bookings*/
CREATE TABLE IF NOT EXISTS bookHotel
(
	bookingDate DATE NOT NULL,
	bookingNumber INT NOT NULL unique,
	checkIn DATE NOT NULL,
	checkOut DATE NOT NULL,
	hotelID INT NOT NULL,
	personID INT NOT NULL,
	transactionID INT NOT NULL,
	PRIMARY KEY (hotelID, personID),
	FOREIGN KEY (hotelID) REFERENCES hotel(hotelID)on delete cascade,
	FOREIGN KEY (personID) REFERENCES customer(personID) on delete cascade
);

/*rooms available*/
CREATE TABLE IF NOT EXISTS RoomsAvailable
(
	roomNumber INT NOT NULL,
	hotelid INT NOT NULL,
	PRIMARY KEY (roomNumber,hotelid),
	FOREIGN KEY (hotelid) REFERENCES hotel(hotelID) on delete cascade
);

/*timer for current date*/
CREATE TABLE IF NOT EXISTS PresentDate
(
	present date not null,
	primary key (present)
);

/*currectly booked details ka table*/
CREATE TABLE IF NOT EXISTS hotelBookingDetails
(
	bookingNumber INT NOT NULL,
	roomNumber INT NOT NULL,
	PRIMARY KEY (bookingNumber),
	FOREIGN KEY (bookingNumber) REFERENCES bookHotel(bookingNumber) on delete cascade
);

/*Cancelled bookings*/
CREATE TABLE IF NOT EXISTS cancelledHotelBookingDetails
(
	cancellationDate DATE NOT NULL,
	bookingNumber INT NOT NULL,	
	refundAmount INT NOT NULL,
	PRIMARY KEY (bookingNumber),
	FOREIGN KEY (bookingNumber) REFERENCES hotelBookingDetails(bookingNumber) on delete cascade
);
CREATE TABLE IF NOT EXISTS planeCompany
(
	numPlanesOwned INT,
	companyID INT NOT NULL,
	companyName VARCHAR(20) NOT NULL,
	rating INT NOT NULL,
	PRIMARY KEY (companyID)
);

CREATE TABLE IF NOT EXISTS planeCompanyAdmin 
(
	personID INT NOT NULL,
	companyID INT NOT NULL,
	username varchar(20) NOT NULL,
	passkey varchar(20) NOT NULL,
	PRIMARY KEY (personID, companyID),
	foreign key (personID) references person(personID) on delete cascade,
	foreign key (companyID) references planeCompany(companyID) on delete cascade
);
CREATE TABLE IF NOT EXISTS plane
(
	capacity INT,
	planeID INT NOT NULL unique,
	companyID INT NOT NULL,
	PRIMARY KEY (companyID, planeID),
	FOREIGN KEY (companyID) REFERENCES planeCompany(companyID) on delete cascade
);

CREATE TABLE IF NOT EXISTS flight
(
	seatsLeft INT,
	flightNumber VARCHAR(10) NOT NULL,
	planeID INT NOT NULL,
	companyID INT NOT NULL,
	source CHAR(10) NOT NULL,
	destination CHAR(10) NOT NULL,
	travelDate DATE NOT NULL,
	ticketCost INT NOT NULL,
	PRIMARY KEY (flightNumber),
	FOREIGN KEY (planeID) REFERENCES plane(planeID) on delete cascade,
    FOREIGN KEY (companyID) REFERENCES planeCompany(companyID) on delete cascade
);
CREATE TABLE IF NOT EXISTS bookFlight
(
	seatNo INT,
	bookingID INT NOT NULL,
	personID INT NOT NULL,
	flightNumber VARCHAR(10) NOT NULL,
	PRIMARY KEY (bookingID),
	FOREIGN KEY (personID) REFERENCES customer(personID) on delete cascade,
	FOREIGN KEY (flightNumber) REFERENCES flight(flightNumber) on delete cascade
);

/*currectly booked details ka table*/
CREATE TABLE IF NOT EXISTS flightBookingDetails
(
	bookingID INT NOT NULL,
	PRIMARY KEY (bookingID),
	FOREIGN KEY (bookingID) REFERENCES bookFlight(bookingID) on delete cascade
);

/*Cancelled bookings*/
CREATE TABLE IF NOT EXISTS cancelledFlightBookingDetails
(
	cancellationDate DATE NOT NULL,
	bookingID INT NOT NULL,	
	refundAmount INT NOT NULL,
	PRIMARY KEY (bookingID),
	FOREIGN KEY (bookingID) REFERENCES flightBookingDetails(bookingID) on delete cascade
);

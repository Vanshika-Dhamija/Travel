INSERT INTO person VALUES ('Ali Azgar', 888888889, 41, 'M', 160005, '1980-05-10', 1);
INSERT INTO person VALUES ('Babar Azam', 888888888, 45, 'F', 160002, '1980-05-20', 2);
INSERT INTO person VALUES ('Camus Albert', 777777777, 30, 'M', 110003, '1992-06-21',3);
INSERT INTO person VALUES ('John Doe', 123456789, 25, 'M', 100001, '1998-05-10', 4);
INSERT INTO person VALUES ('Jane Smith', 987654321, 35, 'F', 200002, '1987-12-15', 5);
INSERT INTO person VALUES ('Sam Williams', 555555555, 40, 'M', 300003, '1982-08-25', 6);
INSERT INTO person VALUES ('Alice Johnson', 111111111, 28, 'F', 400004, '1995-03-18', 7);
INSERT INTO person VALUES ('Bob Brown', 222222222, 50, 'M', 500005, '1972-11-30', 8);
INSERT INTO person VALUES ('Eva White', 333333333, 22, 'F', 600006, '2000-02-05', 9);
INSERT INTO person VALUES ('Chris Miller', 444444444, 33, 'M', 700007, '1989-09-12', 10);
-- select * from person;

INSERT INTO superadmin VALUES (1,'sa','sa');
-- select * from superadmin

INSERT INTO customer VALUES (1, 'av', 'aa');
INSERT INTO customer VALUES (2, 'bh', 'hh');
INSERT INTO customer VALUES (3, 'ch', 'hh');
INSERT INTO customer VALUES (4, 'dh', 'hh');
INSERT INTO customer VALUES (5, 'eh', 'hh');
INSERT INTO customer VALUES (6, 'fh', 'hh');
INSERT INTO customer VALUES (7, 'gh', 'hh');
INSERT INTO customer VALUES (8, 'hh', 'hh');
INSERT INTO customer VALUES (9, 'ih', 'hh');
INSERT INTO customer VALUES (10, 'gh', 'hh');
-- select * from customer;

INSERT INTO cities VALUES (1, 'Mumbai', 400001, 'Maharashtra', 'India');
INSERT INTO cities VALUES (2, 'Delhi', 110001, 'Delhi', 'India');
INSERT INTO cities VALUES (3, 'Bangalore', 560001, 'Karnataka', 'India');
INSERT INTO cities VALUES (4, 'Kolkata', 700001, 'West Bengal', 'India');
INSERT INTO cities VALUES (5, 'Chennai', 600001, 'Tamil Nadu', 'India');
INSERT INTO cities VALUES (6, 'Hyderabad', 500001, 'Telangana', 'India');
INSERT INTO cities VALUES (7, 'Ahmedabad', 380001, 'Gujarat', 'India');
INSERT INTO cities VALUES (8, 'Pune', 411001, 'Maharashtra', 'India');
INSERT INTO cities VALUES (9, 'Jaipur', 302001, 'Rajasthan', 'India');
INSERT INTO cities VALUES (10, 'Lucknow', 226001, 'Uttar Pradesh', 'India');
-- select * from cities

INSERT INTO hotel VALUES (1, 123456789, 'Luxury Inn', 1, 5, 2000, 4);
INSERT INTO hotel VALUES (2, 987654321, 'Grand Plaza', 2, 3, 2500, 5);
INSERT INTO hotel VALUES (3, 111222333, 'Royal Residency', 3, 4, 1800, 4);
INSERT INTO hotel VALUES (4, 444555666, 'Sunset View', 4, 2, 3000, 5);
INSERT INTO hotel VALUES (5, 777888999, 'Elegant Suites', 5, 2, 3500, 4);
INSERT INTO hotel VALUES (6, 999000111, 'City Comfort', 6, 3, 2200, 3);
INSERT INTO hotel VALUES (7, 333444555, 'Green Valley Retreat', 7, 2, 4000, 4);
INSERT INTO hotel VALUES (8, 666777888, 'Sunrise Lodge', 8, 2, 1500, 3);
INSERT INTO hotel VALUES (9, 222333444, 'Heritage Haven', 9, 1, 5000, 5);
INSERT INTO hotel VALUES (10, 555666777, 'Oceanfront Oasis', 1, 45, 2800, 4);
-- select * from hotel




INSERT INTO hotelAdmin VALUES (1, 1,'ba','ba');
INSERT INTO hotelAdmin VALUES (2, 2,'ca','ba');
INSERT INTO hotelAdmin VALUES (3, 3,'da','ba');
INSERT INTO hotelAdmin VALUES (4, 4,'ea','ba');
INSERT INTO hotelAdmin VALUES (5, 5,'fa','ba');
INSERT INTO hotelAdmin VALUES (6, 6,'ga','ba');
INSERT INTO hotelAdmin VALUES (7, 7,'ha','ba');
INSERT INTO hotelAdmin VALUES (8, 8,'ia','ba');
INSERT INTO hotelAdmin VALUES (9, 9,'ja','ba');
INSERT INTO hotelAdmin VALUES (10, 10,'ka','ba');
-- select * from hotelAdmin

INSERT INTO bookHotel VALUES ('2023-01-01', 1, '2023-02-01', '2023-02-10', 1, 1, 101);
INSERT INTO bookHotel VALUES ('2023-03-15', 2, '2023-04-01', '2023-04-07', 2, 2, 102);
INSERT INTO bookHotel VALUES ('2023-05-20', 3, '2023-06-10', '2023-06-20', 3, 3, 103);
INSERT INTO bookHotel VALUES ('2023-07-05', 4, '2023-08-01', '2023-08-05', 4, 4, 104);
INSERT INTO bookHotel VALUES ('2023-09-10', 5, '2023-10-01', '2023-10-10', 5, 5, 105);
INSERT INTO bookHotel VALUES ('2023-11-15', 6, '2023-12-01', '2023-12-15', 6, 6, 106);
INSERT INTO bookHotel VALUES ('2024-01-20', 7, '2024-02-01', '2024-02-05', 7, 7, 107);
INSERT INTO bookHotel VALUES ('2024-03-25', 8, '2024-04-01', '2024-04-10', 8, 8, 108);
INSERT INTO bookHotel VALUES ('2024-05-30', 9, '2024-06-01', '2024-06-07', 9, 9, 109);
INSERT INTO bookHotel VALUES ('2024-07-05', 10, '2024-08-01', '2024-08-10', 10, 10, 110);
-- select * from bookHotel

INSERT INTO hotelBookingDetails VALUES (1, 101);
INSERT INTO hotelBookingDetails VALUES (2, 201);
INSERT INTO hotelBookingDetails VALUES (3, 301);
INSERT INTO hotelBookingDetails VALUES (4, 401);
INSERT INTO hotelBookingDetails VALUES (5, 501);
INSERT INTO hotelBookingDetails VALUES (6, 601);
INSERT INTO hotelBookingDetails VALUES (7, 701);
INSERT INTO hotelBookingDetails VALUES (8, 801);
INSERT INTO hotelBookingDetails VALUES (9, 901);
INSERT INTO hotelBookingDetails VALUES (10, 1001);
-- select * from hotelBookingDetails


INSERT INTO planeCompany VALUES (10, 1, 'Airline1', 4);
INSERT INTO planeCompany VALUES (15, 2, 'Airline2', 5);
INSERT INTO planeCompany VALUES (8, 3, 'Airline3', 3);
INSERT INTO planeCompany VALUES (12, 4, 'Airline4', 4);
INSERT INTO planeCompany VALUES (20, 5, 'Airline5', 5);
INSERT INTO planeCompany VALUES (18, 6, 'Airline6', 4);
INSERT INTO planeCompany VALUES (14, 7, 'Airline7', 3);
INSERT INTO planeCompany VALUES (22, 8, 'Airline8', 5);
INSERT INTO planeCompany VALUES (16, 9, 'Airline9', 4);
INSERT INTO planeCompany VALUES (25, 10, 'Airline10', 5);
-- select * from planeCompany;

INSERT INTO planeCompanyAdmin VALUES (1, 1,'cb','cb');
INSERT INTO planeCompanyAdmin VALUES (2, 2,'db','cb');
INSERT INTO planeCompanyAdmin VALUES (3, 3,'eb','cb');
INSERT INTO planeCompanyAdmin VALUES (4, 4,'fb','cb');
INSERT INTO planeCompanyAdmin VALUES (5, 5,'gb','cb');
INSERT INTO planeCompanyAdmin VALUES (6, 6,'hb','cb');
INSERT INTO planeCompanyAdmin VALUES (7, 7,'ib','cb');
INSERT INTO planeCompanyAdmin VALUES (8, 8,'jb','cb');
INSERT INTO planeCompanyAdmin VALUES (9, 9,'kb','cb');
INSERT INTO planeCompanyAdmin VALUES (10, 10,'lb','cb');
-- select * from planeCompanyAdmin;

INSERT INTO plane VALUES (150, 1, 1);
INSERT INTO plane VALUES (200, 2, 2);
INSERT INTO plane VALUES (120, 3, 3);
INSERT INTO plane VALUES (180, 4, 4);
INSERT INTO plane VALUES (250, 5, 5);
INSERT INTO plane VALUES (220, 6, 6);
INSERT INTO plane VALUES (170, 7, 7);
INSERT INTO plane VALUES (300, 8, 8);
INSERT INTO plane VALUES (160, 9, 9);
INSERT INTO plane VALUES (280, 10, 10);
-- select * from plane;

INSERT INTO flight VALUES (100, 'FL001', 1, 1, 'CityA', 'CityB', '2023-01-15', 1000);
INSERT INTO flight VALUES (150, 'FL002', 2, 2, 'CityC', 'CityD', '2023-02-20', 1200);
INSERT INTO flight VALUES (120, 'FL003', 3, 3, 'CityE', 'CityF', '2023-03-25', 900);
INSERT INTO flight VALUES (180, 'FL004', 4, 4, 'CityG', 'CityH', '2023-04-30', 1500);
INSERT INTO flight VALUES (200, 'FL005', 5, 5, 'CityI', 'CityJ', '2023-05-10', 1800);
INSERT INTO flight VALUES (160, 'FL006', 6, 6, 'CityK', 'CityL', '2023-06-15', 1300);
INSERT INTO flight VALUES (220, 'FL007', 7, 7, 'CityM', 'CityN', '2023-07-20', 2000);
INSERT INTO flight VALUES (130, 'FL008', 8, 8, 'CityO', 'CityP', '2023-08-25', 1100);
INSERT INTO flight VALUES (240, 'FL009', 9, 9, 'CityQ', 'CityR', '2023-09-30', 2200);
INSERT INTO flight VALUES (180, 'FL010', 10, 10, 'CityS', 'CityT', '2023-10-05', 1600);
-- select * from flight;

INSERT INTO bookFlight VALUES (1, 101, 1, 'FL001');
INSERT INTO bookFlight VALUES (2, 102, 2, 'FL002');
INSERT INTO bookFlight VALUES (3, 103, 3, 'FL003');
INSERT INTO bookFlight VALUES (4, 104, 4, 'FL004');
INSERT INTO bookFlight VALUES (5, 105, 5, 'FL005');
INSERT INTO bookFlight VALUES (6, 106, 6, 'FL006');
INSERT INTO bookFlight VALUES (7, 107, 7, 'FL007');
INSERT INTO bookFlight VALUES (8, 108, 8, 'FL008');
INSERT INTO bookFlight VALUES (9, 109, 9, 'FL009');
INSERT INTO bookFlight VALUES (10, 110, 10, 'FL010');
-- select * from bookFlight;


INSERT INTO PresentDate VALUES ('2023-06-06');
--select * from PresentDate 

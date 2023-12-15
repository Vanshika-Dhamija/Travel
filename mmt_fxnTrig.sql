-- DROP FUNCTION IF EXISTS authenticate;
-- DELIMITER $$
-- CREATE FUNCTION authenticate(x varchar(20),y varchar(20)) RETURNS BOOLEAN
-- DETERMINISTIC
-- BEGIN
-- 	if exists (select personid from customer where username=x and passkey=y)
-- 		then return true;
--    else return false;
-- 		end if;
-- END$$
-- DELIMITER;
-- -- authenticate function for user authentication 

-- DELIMITER $$
-- CREATE PROCEDURE gethotels(IN input_param VARCHAR(100))
-- BEGIN
--     -- Your code here using the input parameter

--     DECLARE cty int ;
--     select cityid into cty
--     from cities
--     where cityName=input_param;
    
--     select hotelName
--     from  hotel where cityid=cty order by rating asc;
-- END$$
-- DELIMITER ;
-- -- gethotels procedure to get list of all the hotels in a city 

-- DELIMITER $$
-- CREATE FUNCTION booking( checki date, checko date,  hotel VARCHAR(200)) returns boolean 
-- deterministic
-- BEGIN
--     -- Your code here using the input parameter

--     DECLARE hotelno int;
    
--     select hotelid into hotelno 
--     from hotel where hotelName=hotel;
    
-- 	if exists (select roomNumber from roomsAvailable where hotelid=hotelno)
-- 		then return true;
--     else
-- 		if exists(select * from hotelBookingDetails, bookhotel 
--         where hotelBookingDetails.bookingNumber=bookhotel.bookingNumber and 
--                 bookhotel.hotelid=hotelno and
-- 				(bookhotel.checkIn > checko or bookhotel.checkOut < checki) )
--                 then return true;
--                 else return false;
--                 end if;
-- 	end if;
-- END$$
-- DELIMITER ;
-- -- check if booking is available or not

-- DELIMITER $$
-- CREATE procedure createbooking(in checki date,in checko date,in hotel VARCHAR(200), in person int)
-- BEGIN
--     -- Your code here using the input parameter

--     DECLARE hotelno int;
--     DECLARE room int;
--     DECLARE new_bookid int;
--     DECLARE bookdate date;
--     DECLARE transcid int;
    
--     select curdate() as bookdate;    
--     select hotelid into hotelno 
--     from hotel where hotelName=hotel;
    
-- 	select roomNumber into room from  roomsAvailable where hotelID=hotelno limit 1;
    
-- 	select roomNumber into room from hotelBookingDetails, bookhotel 
-- 	where hotelBookingDetails.bookingNumber=bookhotel.bookingNumber and 
-- 	bookhotel.hotelid=hotelno and
-- 	(bookhotel.checkIn > checko or bookhotel.checkOut < checki)  limit 1;
--     select room as my_message;
    
--     select Rand(UNIX_TIMESTAMP())*100 into new_bookid;
--     select Rand(UNIX_TIMESTAMP())*10000 into transcid;
--     insert into bookhotel values(bookdate,new_bookid,checki, checko, hotelno, person, transcid);
--     insert into hotelbookingdetails values(new_bookid,room);
-- END$$
-- DELIMITER ;
-- -- create a booking 

CREATE OR REPLACE FUNCTION authenticate(x varchar(20), y varchar(20)) 
RETURNS INT AS $$
DECLARE
    person_exists BOOLEAN;
	hoteladminexist BOOLEAN;
	superadminexist BOOLEAN;
	planeadminexist BOOLEAN;
	
BEGIN
    SELECT EXISTS (SELECT 1 FROM customer WHERE username = x AND passkey = y) INTO person_exists;
    SELECT EXISTS (SELECT 1 FROM hoteladmin WHERE username = x AND passkey = y) INTO hoteladminexist;
	SELECT EXISTS (SELECT 1 FROM superadmin WHERE username = x AND passkey = y) INTO superadminexist;
	SELECT EXISTS (SELECT 1 FROM planecompanyadmin WHERE username = x AND passkey = y) INTO planeadminexist;
    IF person_exists THEN
        RETURN 1;
    ELSIF hoteladminexist THEN 
        RETURN 2;
    ELSIF superadminexist THEN
		RETURN 3;
	ELSIF planeadminexist THEN
		RETURN 4;
	ELSE
	   RETURN -1;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gethotels(input_param VARCHAR(100)) RETURNS TABLE (hotelName VARCHAR, rating int, roomcost INT) AS 
$$
DECLARE
    cty int;
BEGIN
    -- Use SELECT INTO to assign the result to the variable
    SELECT cityid INTO cty
    FROM cities
    WHERE cityName = input_param;

    -- RETURN QUERY to return the result of the SELECT statement
    RETURN QUERY
    SELECT hotel.hotelName, hotel.rating, hotel.roomcost
    FROM hotel
    WHERE hotel.cityid = cty
    ORDER BY hotel.rating ASC;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION booking(checki date, checko date, hotel VARCHAR(200)) 
RETURNS BOOLEAN AS $$
DECLARE
    hotelno int;
BEGIN
    SELECT hotelid INTO hotelno 
    FROM hotel 
    WHERE hotelName = booking.hotel; -- Add the alias to clarify the reference
    
    IF EXISTS (SELECT roomNumber FROM roomsAvailable WHERE hotelid = hotelno) THEN
        RETURN true;
    ELSE
        IF EXISTS (SELECT * FROM hotelBookingDetails, bookhotel 
                   WHERE hotelBookingDetails.bookingNumber = bookhotel.bookingNumber 
                   AND bookhotel.hotelid = hotelno 
                   AND  ((bookhotel.checkIn <=checko and bookhotel.checkout>=checko) OR (bookhotel.checkIn <=checki and bookhotel.checkout>=checki))OR (bookhotel.checkin>=checki and bookhotel.checkout<=checko)) THEN
            RETURN false;
        ELSE
            RETURN true;
        END IF;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION createbooking(checki date, checko date, hotel VARCHAR(200), person int)
RETURNS INT
AS $$
DECLARE
    hotelno int;
    room int;
    new_bookid int;
    bookdate date;
    transcid int;
	roomsupdate int;
BEGIN
    SELECT current_date INTO bookdate;    
    SELECT hotelid INTO hotelno 
    FROM hotel 
    WHERE hotelName = createbooking.hotel; -- Corrected reference to the parameter
    
    -- Check if a room is available within the specified date range
    SELECT roomNumber INTO room 
    FROM roomsAvailable 
    WHERE hotelID = hotelno 
    LIMIT 1;
    
    IF room IS NOT NULL THEN
		select roomsleft into roomsupdate from hotel where hotelid=hotelno;
		update hotel set roomsleft= roomsupdate-1 where hotelid=hotelno;
		delete from roomsavailable where hotelid=hotelno and roomnumber=room;
	
--         RAISE EXCEPTION 'No available rooms for the specified date range';
--     END IF;

    ELSE 
	-- Check if the room is available for the given date range
    SELECT roomNumber INTO room 
    FROM hotelBookingDetails, bookhotel 
	WHERE hotelBookingDetails.bookingNumber = bookhotel.bookingNumber 
    AND bookhotel.hotelid = hotelno 
    AND not((bookhotel.checkIn <=checko and bookhotel.checkout>=checko) OR (bookhotel.checkIn <=checki and bookhotel.checkout>=checki) OR (bookhotel.checkin>=checki and bookhotel.checkout<=checko)) 
    LIMIT 1;
	END IF;
    
--     IF room IS NOT NULL THEN
--         RAISE EXCEPTION 'Room is already booked for the specified date range';
--     END IF;

    -- Generate new_bookid and transcid
    SELECT cast(random() * 100 as int) INTO new_bookid;
    SELECT cast(random() * 10000 as int) INTO transcid;
    
    -- Insert booking details into bookhotel table
    INSERT INTO bookhotel VALUES (bookdate, new_bookid, checki, checko, hotelno, person, transcid);
    
    -- Insert booking details into hotelbookingdetails table
    INSERT INTO hotelbookingdetails VALUES (new_bookid, room);
	RETURN room;
END;
$$ LANGUAGE plpgsql;

-- call createbooking('2023-05-09','2023-05-13','Luxury Inn',2);
-- select * from bookhotel;
-- select * from hotelbookingdetails;

CREATE OR REPLACE procedure canceltickets(bookid int) AS
$$
DECLARE
	hid int;
	rno int;
BEGIN
   select hotelid into hid from bookhotel where bookid=bookingnumber;
   select roomnumber into rno from hotelbookingdetails  where  bookid=bookingnumber;
   delete from hotelbookingdetails where bookid=bookingnumber;
   insert into roomsavailable values(rno,hid);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE updatedate(newdate date)
AS $$
BEGIN
	UPDATE presentdate set present=newdate;
END;
$$ LANGUAGE plpgsql;
--call updatedate('2023-06-08')

CREATE OR REPLACE PROCEDURE triggercheckout()
AS $$
DECLARE
	newdate date;
BEGIN
	select present into newdate from presentdate;
	
	insert into roomsavailable(roomnumber,hotelid)
	(select roomnumber,hotelid  
	from hotelbookingdetails natural join bookhotel 
	 where checkout <= newdate
	);

	delete from hotelbookingdetails 
	where hotelbookingdetails.bookingnumber in 
	(select bookingnumber
	 from hotelbookingdetails natural join bookhotel
	 where checkout <= newdate
	);
END;
$$ LANGUAGE plpgsql;
-- call updatedate('2023-10-11');
-- select * from hotel;
-- call createbooking('2023-12-03','2023-12-05','Elegant Suites',9);

-- select * from presentdate;
-- call triggercheckout();

CREATE OR REPLACE FUNCTION trigger_function()
RETURNS TRIGGER AS $$
BEGIN
    --Call the procedure when an update occurs on my_table
    IF TG_OP = 'UPDATE' THEN
        call triggercheckout();
    END IF;

    -- You can add further actions based on your requirements

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER execute_procedure_trigger
AFTER UPDATE ON presentdate
FOR EACH ROW
EXECUTE FUNCTION trigger_function();

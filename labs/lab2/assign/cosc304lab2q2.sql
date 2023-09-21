insert into Airplane
values ('AC911','Boeing 747','2001-01-25'),('WJ455','Airbus A380','2008-11-15');
insert into Airport
values ('YLW','Kelowna Airport','Kelowna','British Columbia','Canada'),
('YWG','Winnipeg Airport','Winnipeg','Manitoba','Canada');
insert into Flight
values ('AC35','YLW','YWG','AC911','2022-09-14 07:00:00','2022-09-14 15:00:00','2022-09-14 07:05:00','2022-09-14 15:30:00'),
       ('WJ111','YWG','YLW','WJ455','2022-09-15 10:00:00','2022-09-15 12:00:00','2022-09-15 09:55:00','2022-09-14 11:49:55');
insert into Passenger
values (1,'Joe','Smith','1970-12-15','1350 Springfield Road','Kelowna','British Columbia','Canada'),
(
   2,
   'Fred',
   'Brothers',
   '1950-01-02',
   '22 Pembina Highway',
   'Winnipeg',
   'Manitoba',
   'Canada'
);
insert into OnFlight
values (1,'AC35','2022-09-14 07:00:00','1A'),
(1,'WJ111','2022-09-15 10:00:00','10C'),
(2,'AC35','2022-09-14 07:00:00','2A'),
(2,'WJ111','2022-09-15 10:00:00','10D');

update OnFlight set seatNumber = '2B' Where passID = 1 AND flightNumber = 'AC35';

update Flight set actualDepartDateTime = DATE_ADD(actualDepartDateTime, INTERVAL 1 HOUR) where departAirport ='YLW';

delete from Airport where AirportID = 'YLW';

delete from OnFlight where PassID = 1 and flightNumber = 'WJ111' ;

delete from OnFlight where passID = 2;
delete from Passenger where passID = 2 ;


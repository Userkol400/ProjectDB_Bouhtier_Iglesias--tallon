SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE RESULT_;
TRUNCATE TABLE TELEMETRY_SESSION;
TRUNCATE TABLE PIT_STOP;
TRUNCATE TABLE CAR;
TRUNCATE TABLE POWER_UNIT;
TRUNCATE TABLE GRAND_PRIX;
TRUNCATE TABLE CIRCUIT;
TRUNCATE TABLE DRIVER;
TRUNCATE TABLE CONSTRUCTOR;

SET FOREIGN_KEY_CHECKS = 1;


-- 1. CONSTRUCTOR (10 rows)
INSERT INTO CONSTRUCTOR (Constructor_Name) VALUES
('Ferrari'), ('Mercedes'), ('Red Bull'), ('McLaren'), ('Aston Martin'),
('Alpine'), ('Williams'), ('RB'), ('Sauber'), ('Haas');

-- 2. DRIVER (20 rows)
INSERT INTO DRIVER (Permanent_Number, First_Name, Last_Name, Nationality, Date_of_Birth, Total_Career_Podiums) VALUES
(1, 'Max', 'Verstappen', 'Dutch', '1997-09-30', 100),
(11, 'Sergio', 'Perez', 'Mexican', '1990-01-26', 35),
(44, 'Lewis', 'Hamilton', 'British', '1985-01-07', 197),
(63, 'George', 'Russell', 'British', '1998-02-15', 11),
(16, 'Charles', 'Leclerc', 'Monegasque', '1997-10-16', 30),
(55, 'Carlos', 'Sainz', 'Spanish', '1994-09-01', 20),
(4, 'Lando', 'Norris', 'British', '1999-11-13', 14),
(81, 'Oscar', 'Piastri', 'Australian', '2001-04-06', 2),
(14, 'Fernando', 'Alonso', 'Spanish', '1981-07-29', 106),
(18, 'Lance', 'Stroll', 'Canadian', '1998-10-29', 3),
(10, 'Pierre', 'Gasly', 'French', '1996-02-07', 4),
(31, 'Esteban', 'Ocon', 'French', '1996-09-17', 3),
(23, 'Alexander', 'Albon', 'Thai', '1996-03-23', 2),
(2, 'Logan', 'Sargeant', 'American', '2000-12-31', 0),
(3, 'Daniel', 'Ricciardo', 'Australian', '1989-07-01', 32),
(22, 'Yuki', 'Tsunoda', 'Japanese', '2000-05-11', 0),
(77, 'Valtteri', 'Bottas', 'Finnish', '1989-08-28', 67),
(24, 'Zhou', 'Guanyu', 'Chinese', '1999-05-30', 0),
(27, 'Nico', 'Hulkenberg', 'German', '1987-08-19', 0),
(20, 'Kevin', 'Magnussen', 'Danish', '1992-10-05', 1);

-- 3. CIRCUIT (10 rows)
INSERT INTO CIRCUIT (Circuit_Name, Circuit_Location, Circuit_Length) VALUES
('Albert Park', 'Melbourne', 5.278),
('Suzuka International Racing Course', 'Suzuka', 5.807),
('Shanghai International Circuit', 'Shanghai', 5.451),
('Miami International Autodrome', 'Miami', 5.412),
('Circuit de Monaco', 'Monte Carlo', 3.337),
('Circuit Gilles Villeneuve', 'Montreal', 4.361),
('Circuit de Barcelona-Catalunya', 'Barcelona', 4.657),
('Red Bull Ring', 'Spielberg', 4.318),
('Silverstone Circuit', 'Silverstone', 5.891),
('Hungaroring', 'Budapest', 4.381);

-- 4. POWER_UNIT (30 rows)
-- Generating 30 PUs with varying mileage and RPM (max 15000)
INSERT INTO POWER_UNIT (PU_ID, PU_Current_Mileage, PU_Maximum_RPM) VALUES
(101, 1200.5, 14850), (102, 850.2, 14900), (103, 2100.0, 14700), (104, 300.5, 15000), (105, 50.0, 14950),
(201, 1100.3, 14800), (202, 900.7, 14850), (203, 1800.2, 14750), (204, 400.1, 14900), (205, 10.0, 15000),
(301, 1300.9, 14820), (302, 700.4, 14880), (303, 2500.5, 14600), (304, 150.8, 14950), (305, 5.0, 15000),
(401, 950.0, 14800), (402, 1050.2, 14800), (403, 1200.0, 14700), (404, 200.0, 14900), (405, 20.0, 15000),
(501, 1150.0, 14850), (502, 880.0, 14900), (503, 1900.0, 14750), (504, 350.0, 15000), (505, 15.0, 14950),
(601, 1000.0, 14800), (602, 500.0, 14900), (603, 2200.0, 14650), (604, 100.0, 14980), (605, 0.0, 15000);

-- 5. GRAND_PRIX (10 rows)
INSERT INTO GRAND_PRIX (GP_Name, GP_Date, Total_Race_Laps, Circuit_Name) VALUES
('Australian GP', '2024-03-24', 58, 'Albert Park'),
('Japanese GP', '2024-04-07', 53, 'Suzuka International Racing Course'),
('Chinese GP', '2024-04-21', 56, 'Shanghai International Circuit'),
('Miami GP', '2024-05-05', 57, 'Miami International Autodrome'),
('Monaco GP', '2024-05-26', 78, 'Circuit de Monaco'),
('Canadian GP', '2024-06-09', 70, 'Circuit Gilles Villeneuve'),
('Spanish GP', '2024-06-23', 66, 'Circuit de Barcelona-Catalunya'),
('Austrian GP', '2024-06-30', 71, 'Red Bull Ring'),
('British GP', '2024-07-07', 52, 'Silverstone Circuit'),
('Hungarian GP', '2024-07-21', 70, 'Hungaroring');

-- 6. CAR (20 rows - 2 per Constructor)
INSERT INTO CAR (Constructor_Name, Chassis_Serial_Number, PU_ID) VALUES
('Red Bull', 'RB20-01', 101), ('Red Bull', 'RB20-02', 102),
('Mercedes', 'W15-01', 201), ('Mercedes', 'W15-02', 202),
('Ferrari', 'SF-24-01', 301), ('Ferrari', 'SF-24-02', 302),
('McLaren', 'MCL38-01', 401), ('McLaren', 'MCL38-02', 402),
('Aston Martin', 'AMR24-01', 501), ('Aston Martin', 'AMR24-02', 502),
('Alpine', 'A524-01', 601), ('Alpine', 'A524-02', 602),
('Williams', 'FW46-01', 103), ('Williams', 'FW46-02', 104),
('RB', 'VCARB01-01', 203), ('RB', 'VCARB01-02', 204),
('Sauber', 'C44-01', 303), ('Sauber', 'C44-02', 304),
('Haas', 'VF-24-01', 503), ('Haas', 'VF-24-02', 504);

-- 7. PIT_STOP (50 rows)
-- Example: Logic for 5 Constructors over various GPs
INSERT INTO PIT_STOP (Constructor_Name, Chassis_Serial_Number, GP_Name, Pit_Stop_Lap_Number, Pit_Stop_Stationary_Duration, Total_Pit_Lane_Duration, Tires_Fitted) VALUES
('Red Bull', 'RB20-01', 'Australian GP', 17, 2.1, 21.5, 'Hard'),
('Red Bull', 'RB20-01', 'Australian GP', 35, 2.3, 21.8, 'Medium'),
('Red Bull', 'RB20-02', 'Australian GP', 18, 2.5, 22.0, 'Hard'),
('Ferrari', 'SF-24-01', 'Australian GP', 15, 2.2, 21.4, 'Hard'),
('Ferrari', 'SF-24-02', 'Australian GP', 16, 2.4, 21.9, 'Hard'),
('Mercedes', 'W15-01', 'Japanese GP', 12, 2.8, 23.1, 'Medium'),
('Mercedes', 'W15-02', 'Japanese GP', 13, 2.6, 22.8, 'Medium'),
('McLaren', 'MCL38-01', 'Japanese GP', 10, 2.1, 21.0, 'Hard'),
('McLaren', 'MCL38-02', 'Japanese GP', 11, 2.2, 21.2, 'Hard'),
('Aston Martin', 'AMR24-01', 'Chinese GP', 20, 2.9, 24.5, 'Medium'),
('Alpine', 'A524-01', 'Chinese GP', 15, 3.1, 25.0, 'Hard'),
('Williams', 'FW46-01', 'Chinese GP', 18, 2.8, 24.2, 'Soft'),
('RB', 'VCARB01-01', 'Miami GP', 12, 2.5, 21.5, 'Hard'),
('Sauber', 'C44-01', 'Miami GP', 14, 4.5, 26.0, 'Medium'),
('Haas', 'VF-24-01', 'Miami GP', 15, 2.7, 22.3, 'Hard'),
('Red Bull', 'RB20-01', 'Monaco GP', 50, 2.2, 25.5, 'Medium'),
('Ferrari', 'SF-24-01', 'Monaco GP', 51, 2.1, 25.1, 'Medium'),
('Mercedes', 'W15-01', 'Monaco GP', 48, 2.3, 25.8, 'Hard'),
('Red Bull', 'RB20-01', 'Canadian GP', 25, 2.4, 19.5, 'Intermediate'),
('Red Bull', 'RB20-02', 'Canadian GP', 26, 2.5, 19.8, 'Intermediate'),
('Ferrari', 'SF-24-01', 'Canadian GP', 45, 2.1, 18.9, 'Hard'),
('McLaren', 'MCL38-01', 'Canadian GP', 22, 2.2, 19.1, 'Intermediate'),
('Mercedes', 'W15-01', 'Spanish GP', 18, 2.5, 21.2, 'Medium'),
('Mercedes', 'W15-01', 'Spanish GP', 42, 2.4, 21.0, 'Soft'),
('Red Bull', 'RB20-01', 'Spanish GP', 16, 2.1, 20.8, 'Medium'),
('Red Bull', 'RB20-01', 'Spanish GP', 40, 2.2, 20.9, 'Soft'),
('Ferrari', 'SF-24-01', 'Spanish GP', 17, 2.3, 21.1, 'Medium'),
('McLaren', 'MCL38-01', 'Spanish GP', 21, 2.1, 20.5, 'Medium'),
('Red Bull', 'RB20-01', 'Austrian GP', 22, 2.2, 21.0, 'Hard'),
('Red Bull', 'RB20-01', 'Austrian GP', 50, 2.3, 21.2, 'Medium'),
('Ferrari', 'SF-24-01', 'Austrian GP', 23, 2.4, 21.5, 'Hard'),
('Mercedes', 'W15-01', 'Austrian GP', 24, 2.5, 21.6, 'Hard'),
('McLaren', 'MCL38-01', 'Austrian GP', 20, 2.2, 20.8, 'Hard'),
('Red Bull', 'RB20-01', 'British GP', 15, 2.1, 28.5, 'Intermediate'),
('Red Bull', 'RB20-02', 'British GP', 16, 2.2, 28.8, 'Intermediate'),
('Mercedes', 'W15-01', 'British GP', 18, 2.3, 29.0, 'Intermediate'),
('Ferrari', 'SF-24-01', 'British GP', 10, 2.5, 29.5, 'Intermediate'),
('McLaren', 'MCL38-01', 'British GP', 19, 2.2, 28.7, 'Intermediate'),
('Red Bull', 'RB20-01', 'Hungarian GP', 18, 2.1, 21.5, 'Hard'),
('Red Bull', 'RB20-01', 'Hungarian GP', 45, 2.2, 21.8, 'Medium'),
('McLaren', 'MCL38-01', 'Hungarian GP', 17, 2.1, 21.3, 'Hard'),
('McLaren', 'MCL38-01', 'Hungarian GP', 44, 2.2, 21.4, 'Medium'),
('McLaren', 'MCL38-02', 'Hungarian GP', 16, 2.3, 21.6, 'Hard'),
('McLaren', 'MCL38-02', 'Hungarian GP', 43, 2.4, 21.7, 'Medium'),
('Ferrari', 'SF-24-01', 'Hungarian GP', 20, 2.2, 21.5, 'Hard'),
('Ferrari', 'SF-24-02', 'Hungarian GP', 21, 2.3, 21.6, 'Hard'),
('Mercedes', 'W15-01', 'Hungarian GP', 15, 2.4, 21.8, 'Hard'),
('Mercedes', 'W15-02', 'Hungarian GP', 16, 2.5, 21.9, 'Hard'),
('Aston Martin', 'AMR24-01', 'Hungarian GP', 12, 2.6, 22.0, 'Hard'),
('Haas', 'VF-24-01', 'Hungarian GP', 10, 2.7, 22.1, 'Hard');

-- 8. TELEMETRY_SESSION (100 rows)
-- Sample data across Session_Types, Speed, RPM (0-15000), Gear (-1 to 8)
INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected) VALUES
('Australian GP', 'Red Bull', 'RB20-01', '2024-03-24 15:00:01', 'Race', 280, 12500, 100.0, 7),
('Australian GP', 'Red Bull', 'RB20-01', '2024-03-24 15:00:02', 'Race', 310, 14200, 99.8, 8),
('Australian GP', 'Red Bull', 'RB20-01', '2024-03-24 15:00:03', 'Race', 80, 5000, 99.6, 2),
('Australian GP', 'Ferrari', 'SF-24-01', '2024-03-24 15:00:01', 'Race', 278, 12400, 100.0, 7),
('Australian GP', 'Ferrari', 'SF-24-01', '2024-03-24 15:00:02', 'Race', 308, 14100, 99.7, 8),
('Japanese GP', 'Mercedes', 'W15-01', '2024-04-06 14:00:01', 'Q3', 320, 14800, 10.0, 8),
('Japanese GP', 'Mercedes', 'W15-01', '2024-04-06 14:00:02', 'Q3', 150, 11000, 9.8, 4),
('Japanese GP', 'McLaren', 'MCL38-01', '2024-04-05 11:30:00', 'FP1', 250, 11000, 50.0, 6),
('Chinese GP', 'Aston Martin', 'AMR24-01', '2024-04-21 15:10:00', 'Race', 290, 13000, 80.0, 7),
('Chinese GP', 'Red Bull', 'RB20-02', '2024-04-21 15:10:00', 'Race', 295, 13200, 82.0, 7);

-- Blocs générés automatiquement avec correction CONCAT()
INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'Miami GP', 'Red Bull', 'RB20-01', CONCAT('2024-05-05 16:00:', (10+t.n)), 'Race', 200 + t.n, 12000 + (t.n * 10), 90 - (t.n * 0.1), 6
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'Monaco GP', 'Ferrari', 'SF-24-01', CONCAT('2024-05-26 15:00:', (10+t.n)), 'Race', 150 + t.n, 10000 + (t.n * 10), 85 - (t.n * 0.1), 4
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'Canadian GP', 'McLaren', 'MCL38-01', CONCAT('2024-06-09 14:00:', (10+t.n)), 'Race', 220 + t.n, 11500 + (t.n * 10), 75 - (t.n * 0.1), 5
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'Spanish GP', 'Mercedes', 'W15-01', CONCAT('2024-06-23 15:00:', (10+t.n)), 'Race', 240 + t.n, 12000 + (t.n * 10), 65 - (t.n * 0.1), 6
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'Austrian GP', 'Red Bull', 'RB20-02', CONCAT('2024-06-30 15:00:', (10+t.n)), 'Race', 260 + t.n, 13000 + (t.n * 10), 55 - (t.n * 0.1), 7
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'British GP', 'McLaren', 'MCL38-02', CONCAT('2024-07-07 15:00:', (10+t.n)), 'Race', 270 + t.n, 13500 + (t.n * 10), 45 - (t.n * 0.1), 7
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'Hungarian GP', 'Ferrari', 'SF-24-02', CONCAT('2024-07-21 15:00:', (10+t.n)), 'Race', 210 + t.n, 12500 + (t.n * 10), 35 - (t.n * 0.1), 6
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'Australian GP', 'Williams', 'FW46-01', CONCAT('2024-03-22 13:00:', (10+t.n)), 'FP1', 180 + t.n, 9000 + (t.n * 10), 40 - (t.n * 0.1), 5
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

INSERT INTO TELEMETRY_SESSION (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp, Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
SELECT 'Japanese GP', 'Alpine', 'A524-01', CONCAT('2024-04-06 14:15:', (10+t.n)), 'Q3', 300 + t.n, 14500 + (t.n * 2), 5 - (t.n * 0.1), 8
FROM (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t;

-- 9. RESULT_ (100 rows)
-- Results for 10 GPs with 10 Drivers per GP
INSERT INTO RESULT_ (Permanent_Number, Constructor_Name, GP_Name, Race_Finishing_Position, Championship_Points_Earned, Fastest_Lap_Time, Status) VALUES
-- Australian GP
(1, 'Red Bull', 'Australian GP', 1, 25, '1:19.813', 'Finished'),
(11, 'Red Bull', 'Australian GP', 2, 18, '1:20.125', 'Finished'),
(16, 'Ferrari', 'Australian GP', 3, 15, '1:20.005', 'Finished'),
(55, 'Ferrari', 'Australian GP', 4, 12, '1:20.444', 'Finished'),
(4, 'McLaren', 'Australian GP', 5, 10, '1:20.555', 'Finished'),
(81, 'McLaren', 'Australian GP', 6, 8, '1:20.666', 'Finished'),
(44, 'Mercedes', 'Australian GP', 7, 6, '1:20.777', 'Finished'),
(63, 'Mercedes', 'Australian GP', 8, 4, '1:20.888', 'Finished'),
(14, 'Aston Martin', 'Australian GP', 9, 2, '1:21.000', 'Finished'),
(18, 'Aston Martin', 'Australian GP', 10, 1, '1:21.111', 'Finished'),
-- Japanese GP
(1, 'Red Bull', 'Japanese GP', 1, 26, '1:33.123', 'Finished'),
(11, 'Red Bull', 'Japanese GP', 2, 18, '1:33.500', 'Finished'),
(55, 'Ferrari', 'Japanese GP', 3, 15, '1:33.600', 'Finished'),
(16, 'Ferrari', 'Japanese GP', 4, 12, '1:33.700', 'Finished'),
(4, 'McLaren', 'Japanese GP', 5, 10, '1:33.800', 'Finished'),
(14, 'Aston Martin', 'Japanese GP', 6, 8, '1:33.900', 'Finished'),
(63, 'Mercedes', 'Japanese GP', 7, 6, '1:34.000', 'Finished'),
(81, 'McLaren', 'Japanese GP', 8, 4, '1:34.100', 'Finished'),
(44, 'Mercedes', 'Japanese GP', 9, 2, '1:34.200', 'Finished'),
(22, 'RB', 'Japanese GP', 10, 1, '1:34.500', 'Finished'),
-- Chinese GP
(1, 'Red Bull', 'Chinese GP', 1, 25, '1:37.410', 'Finished'),
(4, 'McLaren', 'Chinese GP', 2, 18, '1:38.100', 'Finished'),
(11, 'Red Bull', 'Chinese GP', 3, 15, '1:38.200', 'Finished'),
(16, 'Ferrari', 'Chinese GP', 4, 12, '1:38.300', 'Finished'),
(55, 'Ferrari', 'Chinese GP', 5, 10, '1:38.400', 'Finished'),
(63, 'Mercedes', 'Chinese GP', 6, 8, '1:38.500', 'Finished'),
(14, 'Aston Martin', 'Chinese GP', 7, 6, '1:38.600', 'Finished'),
(81, 'McLaren', 'Chinese GP', 8, 4, '1:38.700', 'Finished'),
(44, 'Mercedes', 'Chinese GP', 9, 2, '1:38.800', 'Finished'),
(27, 'Haas', 'Chinese GP', 10, 1, '1:39.000', 'Finished'),
-- Miami GP
(4, 'McLaren', 'Miami GP', 1, 25, '1:30.634', 'Finished'),
(1, 'Red Bull', 'Miami GP', 2, 18, '1:30.800', 'Finished'),
(16, 'Ferrari', 'Miami GP', 3, 15, '1:30.900', 'Finished'),
(11, 'Red Bull', 'Miami GP', 4, 12, '1:31.000', 'Finished'),
(55, 'Ferrari', 'Miami GP', 5, 10, '1:31.100', 'Finished'),
(44, 'Mercedes', 'Miami GP', 6, 8, '1:31.200', 'Finished'),
(63, 'Mercedes', 'Miami GP', 7, 6, '1:31.300', 'Finished'),
(14, 'Aston Martin', 'Miami GP', 8, 4, '1:31.400', 'Finished'),
(31, 'Alpine', 'Miami GP', 9, 2, '1:31.800', 'Finished'),
(22, 'RB', 'Miami GP', 10, 1, '1:31.900', 'Finished'),
-- Monaco GP
(16, 'Ferrari', 'Monaco GP', 1, 25, '1:15.160', 'Finished'),
(81, 'McLaren', 'Monaco GP', 2, 18, '1:15.500', 'Finished'),
(55, 'Ferrari', 'Monaco GP', 3, 15, '1:15.600', 'Finished'),
(4, 'McLaren', 'Monaco GP', 4, 12, '1:15.700', 'Finished'),
(63, 'Mercedes', 'Monaco GP', 5, 10, '1:15.800', 'Finished'),
(1, 'Red Bull', 'Monaco GP', 6, 8, '1:15.900', 'Finished'),
(44, 'Mercedes', 'Monaco GP', 7, 7, '1:14.500', 'Finished'),
(22, 'RB', 'Monaco GP', 8, 4, '1:16.000', 'Finished'),
(23, 'Williams', 'Monaco GP', 9, 2, '1:16.200', 'Finished'),
(10, 'Alpine', 'Monaco GP', 10, 1, '1:16.400', 'Finished'),
-- Canadian GP
(1, 'Red Bull', 'Canadian GP', 1, 25, '1:15.542', 'Finished'),
(4, 'McLaren', 'Canadian GP', 2, 18, '1:15.700', 'Finished'),
(63, 'Mercedes', 'Canadian GP', 3, 15, '1:15.800', 'Finished'),
(44, 'Mercedes', 'Canadian GP', 4, 13, '1:14.800', 'Finished'),
(81, 'McLaren', 'Canadian GP', 5, 10, '1:16.000', 'Finished'),
(14, 'Aston Martin', 'Canadian GP', 6, 8, '1:16.200', 'Finished'),
(18, 'Aston Martin', 'Canadian GP', 7, 6, '1:16.400', 'Finished'),
(3, 'RB', 'Canadian GP', 8, 4, '1:16.600', 'Finished'),
(22, 'RB', 'Canadian GP', 9, 2, '1:16.800', 'Finished'),
(10, 'Alpine', 'Canadian GP', 10, 1, '1:17.000', 'Finished'),
-- Spanish GP
(1, 'Red Bull', 'Spanish GP', 1, 25, '1:17.333', 'Finished'),
(4, 'McLaren', 'Spanish GP', 2, 19, '1:17.111', 'Finished'),
(44, 'Mercedes', 'Spanish GP', 3, 15, '1:17.500', 'Finished'),
(63, 'Mercedes', 'Spanish GP', 4, 12, '1:17.600', 'Finished'),
(16, 'Ferrari', 'Spanish GP', 5, 10, '1:17.700', 'Finished'),
(55, 'Ferrari', 'Spanish GP', 6, 8, '1:17.800', 'Finished'),
(81, 'McLaren', 'Spanish GP', 7, 6, '1:17.900', 'Finished'),
(11, 'Red Bull', 'Spanish GP', 8, 4, '1:18.000', 'Finished'),
(10, 'Alpine', 'Spanish GP', 9, 2, '1:18.200', 'Finished'),
(31, 'Alpine', 'Spanish GP', 10, 1, '1:18.400', 'Finished'),
-- Austrian GP
(63, 'Mercedes', 'Austrian GP', 1, 25, '1:07.900', 'Finished'),
(81, 'McLaren', 'Austrian GP', 2, 18, '1:08.000', 'Finished'),
(55, 'Ferrari', 'Austrian GP', 3, 15, '1:08.100', 'Finished'),
(44, 'Mercedes', 'Austrian GP', 4, 12, '1:08.200', 'Finished'),
(1, 'Red Bull', 'Austrian GP', 5, 10, '1:08.300', 'Finished'),
(27, 'Haas', 'Austrian GP', 6, 8, '1:08.500', 'Finished'),
(11, 'Red Bull', 'Austrian GP', 7, 6, '1:08.600', 'Finished'),
(3, 'RB', 'Austrian GP', 8, 4, '1:08.700', 'Finished'),
(10, 'Alpine', 'Austrian GP', 9, 2, '1:08.800', 'Finished'),
(20, 'Haas', 'Austrian GP', 10, 1, '1:09.000', 'Finished'),
-- British GP
(44, 'Mercedes', 'British GP', 1, 25, '1:29.500', 'Finished'),
(1, 'Red Bull', 'British GP', 2, 18, '1:29.600', 'Finished'),
(4, 'McLaren', 'British GP', 3, 15, '1:29.700', 'Finished'),
(81, 'McLaren', 'British GP', 4, 12, '1:29.800', 'Finished'),
(55, 'Ferrari', 'British GP', 5, 11, '1:28.500', 'Finished'),
(27, 'Haas', 'British GP', 6, 8, '1:30.000', 'Finished'),
(18, 'Aston Martin', 'British GP', 7, 6, '1:30.200', 'Finished'),
(14, 'Aston Martin', 'British GP', 8, 4, '1:30.400', 'Finished'),
(23, 'Williams', 'British GP', 9, 2, '1:30.600', 'Finished'),
(22, 'RB', 'British GP', 10, 1, '1:30.800', 'Finished'),
-- Hungarian GP
(81, 'McLaren', 'Hungarian GP', 1, 25, '1:21.000', 'Finished'),
(4, 'McLaren', 'Hungarian GP', 2, 18, '1:21.100', 'Finished'),
(44, 'Mercedes', 'Hungarian GP', 3, 15, '1:21.200', 'Finished'),
(16, 'Ferrari', 'Hungarian GP', 4, 12, '1:21.300', 'Finished'),
(1, 'Red Bull', 'Hungarian GP', 5, 10, '1:21.400', 'Finished'),
(55, 'Ferrari', 'Hungarian GP', 6, 8, '1:21.500', 'Finished'),
(11, 'Red Bull', 'Hungarian GP', 7, 6, '1:21.600', 'Finished'),
(63, 'Mercedes', 'Hungarian GP', 8, 5, '1:20.500', 'Finished'),
(22, 'RB', 'Hungarian GP', 9, 2, '1:22.000', 'Finished'),
(18, 'Aston Martin', 'Hungarian GP', 10, 1, '1:22.200', 'Finished');

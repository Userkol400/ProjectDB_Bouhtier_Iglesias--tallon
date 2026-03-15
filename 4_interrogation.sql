
/* Part 1: Projections, selections, sorting, LIKE, IN, BETWEEN */

/* Get unique driver nationalities */
SELECT DISTINCT Nationality 
FROM DRIVER;

/* Find drivers born in the 90s */
SELECT First_Name, Last_Name, Date_of_Birth 
FROM DRIVER 
WHERE Date_of_Birth BETWEEN '1990-01-01' AND '2000-12-31'
ORDER BY Date_of_Birth ASC;

/* Search for circuits with "Silver" in the name */
SELECT Circuit_Name, Circuit_Location 
FROM CIRCUIT 
WHERE Circuit_Name LIKE '%Silver%';

/* Get results for drivers who finished or DNF */
SELECT Permanent_Number, GP_Name, Race_Finishing_Position 
FROM RESULT_ 
WHERE Status IN ('Finished', 'DNF')
ORDER BY Race_Finishing_Position;

/* Top speeds over 330 km/h sorted highest to lowest */
SELECT GP_Name, Session_Type, Car_Speed 
FROM TELEMETRY_SESSION 
WHERE Car_Speed > 330 
ORDER BY Car_Speed DESC;


/* Part 2: Aggregation functions with GROUP BY and HAVING */

/* Average pit stop time under 3s per constructor */
SELECT Constructor_Name, AVG(Pit_Stop_Stationary_Duration) AS Avg_Pit_Stop
FROM PIT_STOP
GROUP BY Constructor_Name
HAVING AVG(Pit_Stop_Stationary_Duration) < 3.000;

/* Count number of wins per driver */
SELECT Permanent_Number, COUNT(Race_Finishing_Position) AS Total_Wins
FROM RESULT_
WHERE Race_Finishing_Position = 1
GROUP BY Permanent_Number
HAVING COUNT(Race_Finishing_Position) > 0;

/* Total points per constructor (only above 50 points) */
SELECT Constructor_Name, SUM(Championship_Points_Earned) AS Total_Points
FROM RESULT_
GROUP BY Constructor_Name
HAVING SUM(Championship_Points_Earned) > 50;

/* Max speed per session type over 300 km/h */
SELECT Session_Type, MAX(Car_Speed) AS Max_Speed
FROM TELEMETRY_SESSION
GROUP BY Session_Type
HAVING MAX(Car_Speed) > 300;

/* Total PU mileage per team under 10000 km */
SELECT Constructor_Name, SUM(PU_Current_Mileage) AS Total_Mileage
FROM CAR
JOIN POWER_UNIT ON CAR.PU_ID = POWER_UNIT.PU_ID
GROUP BY Constructor_Name
HAVING SUM(PU_Current_Mileage) < 10000;


/* Part 3: Joins (Inner, Left, Multiple) */

/* Join GP and circuits to get the track length */
SELECT G.GP_Name, G.GP_Date, C.Circuit_Length
FROM GRAND_PRIX G
INNER JOIN CIRCUIT C ON G.Circuit_Name = C.Circuit_Name;

/* All drivers and their points (even with no results) */
SELECT D.First_Name, D.Last_Name, R.GP_Name, R.Championship_Points_Earned
FROM DRIVER D
LEFT JOIN RESULT_ R ON D.Permanent_Number = R.Permanent_Number;

/* Car details linked to constructor and PU info */
SELECT C.Constructor_Name, C.Chassis_Serial_Number, P.PU_Maximum_RPM
FROM CAR C
INNER JOIN CONSTRUCTOR CO ON C.Constructor_Name = CO.Constructor_Name
INNER JOIN POWER_UNIT P ON C.PU_ID = P.PU_ID;

/* Pit stops linked with the race date */
SELECT P.Constructor_Name, P.Tires_Fitted, G.GP_Date
FROM PIT_STOP P
INNER JOIN GRAND_PRIX G ON P.GP_Name = G.GP_Name;

/* Full race standings (Driver, Team, GP, Position) */
SELECT D.Last_Name, R.Constructor_Name, R.GP_Name, R.Race_Finishing_Position
FROM RESULT_ R
INNER JOIN DRIVER D ON R.Permanent_Number = D.Permanent_Number
ORDER BY R.GP_Name, R.Race_Finishing_Position;


/* Part 4: Nested queries (IN, NOT EXISTS, ANY, ALL) */

/* Drivers who scored points */
SELECT First_Name, Last_Name 
FROM DRIVER 
WHERE Permanent_Number IN (
    SELECT Permanent_Number FROM RESULT_ WHERE Championship_Points_Earned > 0
);

/* Circuits that have no races scheduled yet */
SELECT Circuit_Name 
FROM CIRCUIT C
WHERE NOT EXISTS (
    SELECT 1 FROM GRAND_PRIX G WHERE G.Circuit_Name = C.Circuit_Name
);

/* Drivers with more podiums than any French driver */
SELECT First_Name, Last_Name, Total_Career_Podiums
FROM DRIVER
WHERE Total_Career_Podiums > ANY (
    SELECT Total_Career_Podiums FROM DRIVER WHERE Nationality = 'French'
);

/* Telemetry with RPM higher than all FP1 sessions */
SELECT GP_Name, Session_Type, Engine_RPM
FROM TELEMETRY_SESSION
WHERE Engine_RPM > ALL (
    SELECT Engine_RPM FROM TELEMETRY_SESSION WHERE Session_Type = 'FP1'
);

/* Unused power units (not assigned to a car) */
SELECT PU_ID 
FROM POWER_UNIT 
WHERE PU_ID NOT IN (
    SELECT PU_ID FROM CAR WHERE PU_ID IS NOT NULL
);

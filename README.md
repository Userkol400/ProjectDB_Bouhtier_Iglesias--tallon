# ProjectDB_Bouhtier_Iglesias--tallon

The prompt : 

You work in the field of Formula 1 professional racing and engineering. Your Formula 1 constructor and racing team is involved in the domain of managing high-performance racing logistics, technical telemetry, and championship participation. It is a Formula 1 constructor and racing team such as Mercedes-AMG Petronas F1 Team or Scuderia Ferrari. We have gathered information about our drivers and their career history, technical specifications of our chassis and power units, real-time race telemetry logs, grand prix schedules, and detailed results of our pit stop performances. Take inspiration from the following official Formula 1 technical regulations and the historical race data available on the FIA and Formula1.com websites.
Your Formula 1 constructor and racing team  wants to apply MERISE to design an information system. You are responsible for the analysis part, i.e., gathering the company's requirements. It has called on a computer engineering student to carry out this project, and you must provide him with the necessary information so that he can then apply the following steps of database design and development himself.
First, establish the data business rules for your Formula 1 constructor and racing team  in the form of a bulleted list. It must correspond to the information provided by someone who knows how the company works, but not how an information system is built.
Next, based on these rules, provide a raw data dictionary with the following columns, grouped in a table: meaning of the data, type, size in number of characters or digits. There should be between 25 and 35 data items. It is used to provide additional information about each data item (size and type) but without any assumptions about how the data will be modeled later.
Provide the business rules and the data dictionary.


Rules :

Business Rules: Paddock Operations

These rules describe how our team functions on a day-to-day basis. They define the constraints and relationships that must be respected by the future database.

Drivers & Identity: Each driver is identified by a unique permanent racing number (assigned by the FIA). We track their full name, nationality, and birth date for administrative and marketing purposes.

The Power Unit & Chassis: A car is a combination of a specific Chassis ID and a Power Unit (PU). We must track the total mileage (kilometers) of every Power Unit to ensure we don't exceed the FIA's seasonal allocation and face grid penalties.

Grand Prix Events: The championship consists of several Grands Prix. Each event is held at a specific circuit on a scheduled date. A circuit has a set length and a specific number of laps for a full race distance.

Session Participation: For every Grand Prix weekend, our team enters exactly two cars. Each car is assigned to one specific driver for that event.

Telemetry Monitoring: During any track session (Practice, Qualifying, Race), we record real-time telemetry samples. Each sample captures the car's speed, engine RPM, and fuel level at a precise timestamp.

Pit Stop Execution: A pit stop occurs during a race for a specific car. We record the lap number when it happened, the duration of the "stationary time" (the actual tire change), and the total time spent in the pit lane.

Race Results: After the checkered flag, we record the final finishing position, the number of points earned, and the fastest lap time achieved by each driver.

Historical Tracking: We maintain a record of our drivers' career histories, including their previous teams and total career podiums, to provide context for our performance analytics.



Raw Data Dictionary :


Meaning of the Data	Type	Size (Chars/Digits)

Driver Permanent Number	Numeric	2

Driver First Name	Alphanumeric	30

Driver Last Name	Alphanumeric	30

Driver Nationality	Alphanumeric	20

Driver Date of Birth	Date	10

Total Career Podiums	Numeric	3

Chassis Serial Number	Alphanumeric	10

Power Unit (PU) ID	Alphanumeric	15

PU Current Mileage (km)	Numeric	6

PU Maximum RPM	Numeric	5

Circuit Name	Alphanumeric	50

Circuit Location (Country)	Alphanumeric	30

Circuit Length (meters)	Numeric	5

Grand Prix Name	Alphanumeric	50

Grand Prix Date	Date	10

Total Race Laps	Numeric	2

Session Type (e.g., FP1, Q3, Race)	Alphanumeric	15

Telemetry Timestamp	Time/Long	15

Car Speed (km/h)	Numeric	3

Engine RPM	Numeric	5

Current Fuel Level (kg)	Numeric	3

Gear Selected	Numeric	1

Pit Stop Lap Number	Numeric	2

Pit Stop Stationary Duration (sec)	Numeric (Decimal)	5

Total Pit Lane Duration (sec)	Numeric (Decimal)	6

Tires Fitted (e.g., Soft, Medium, Hard)	Alphanumeric	10

Race Finishing Position	Numeric	2

Championship Points Earned	Numeric	2

Fastest Lap Time (mm:ss.ms)	Alphanumeric	10

Status (e.g., Finished, DNF, DSQ)	Alphanumeric	15

Constructor Name	Alphanumeric	40




Advanced Modeling Elements :

n-ary relationship (n>2): The RESULT association is a valid n-ary relationship because it simultaneously connects three distinct entities: DRIVER, CONSTRUCTOR, and GRAND_PRIX. This structure is essential for centralizing race outcome data—such as finishing position, points earned, and lap times—for a specific driver within a specific team during a single event.

Relative Identification (Weak/Strong Entities): The PIT_STOP and TELEMETRY_SESSION entities are modeled as weak entities using relative identification (1,1)(R). These entities do not possess a globally unique identifier and are structurally dependent on their relationships with strong entities (GRAND_PRIX and CAR) to be uniquely identified within the system.

image MCD looping : 
<img width="1573" height="700" alt="image" src="https://github.com/user-attachments/assets/354b9d0f-9ba0-429b-8975-6e5ceb6ac75c" />



Image LDM looping : 
<img width="1717" height="759" alt="image" src="https://github.com/user-attachments/assets/d538a16c-9e7d-4782-bf53-6f155d0bf73d" />


Prompt Fourth Step :

Act as an SQL database expert. Provide the insertion queries (INSERT INTO) used to populate my Formula 1 database.

CREATE TABLE CIRCUIT (
    Circuit_Name VARCHAR(100) PRIMARY KEY,
    Circuit_Location VARCHAR(100) NOT NULL,
    Circuit_Length DECIMAL(5,3) NOT NULL
);

CREATE TABLE CONSTRUCTOR (
    Constructor_Name VARCHAR(100) PRIMARY KEY
);

CREATE TABLE DRIVER (
    Permanent_Number INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Nationality VARCHAR(50),
    Date_of_Birth DATE,
    Total_Career_Podiums INT DEFAULT 0
);

CREATE TABLE POWER_UNIT (
    PU_ID VARCHAR(50) PRIMARY KEY,
    PU_Current_Mileage DECIMAL(8,2),
    PU_Maximum_RPM INT
);

CREATE TABLE GRAND_PRIX (
    GP_Name VARCHAR(100) PRIMARY KEY,
    GP_Date DATE NOT NULL,
    Total_Race_Laps INT NOT NULL,
    Circuit_Name VARCHAR(100) NOT NULL,
    FOREIGN KEY (Circuit_Name) REFERENCES CIRCUIT(Circuit_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CAR (
    Constructor_Name VARCHAR(100),
    Chassis_Serial_Number VARCHAR(100),
    PU_ID VARCHAR(50),
    PRIMARY KEY (Constructor_Name, Chassis_Serial_Number),
    FOREIGN KEY (Constructor_Name) REFERENCES CONSTRUCTOR(Constructor_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PU_ID) REFERENCES POWER_UNIT(PU_ID) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RESULT (
    Permanent_Number INT,
    Constructor_Name VARCHAR(100),
    GP_Name VARCHAR(100),
    Race_Finishing_Position INT,
    Championship_Points_Earned DECIMAL(4,1),
    Fastest_Lap_Time VARCHAR(15),
    Status VARCHAR(50),
    PRIMARY KEY (Permanent_Number, Constructor_Name, GP_Name),
    FOREIGN KEY (Permanent_Number) REFERENCES DRIVER(Permanent_Number) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Constructor_Name) REFERENCES CONSTRUCTOR(Constructor_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (GP_Name) REFERENCES GRAND_PRIX(GP_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PIT_STOP (
    Constructor_Name VARCHAR(100),
    Chassis_Serial_Number VARCHAR(100),
    GP_Name VARCHAR(100),
    Pit_Stop_Lap_Number INT,
    Pit_Stop_Stationary_Duration DECIMAL(5,3),
    Total_Pit_Lane_Duration DECIMAL(6,3),
    Tires_Fitted VARCHAR(20),
    PRIMARY KEY (Constructor_Name, Chassis_Serial_Number, GP_Name, Pit_Stop_Lap_Number),
    FOREIGN KEY (Constructor_Name, Chassis_Serial_Number) REFERENCES CAR(Constructor_Name, Chassis_Serial_Number) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (GP_Name) REFERENCES GRAND_PRIX(GP_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TELEMETRY_SESSION (
    GP_Name VARCHAR(100),
    Constructor_Name VARCHAR(100),
    Chassis_Serial_Number VARCHAR(100),
    Session_Type VARCHAR(50),
    Telemetry_Timestamp TIMESTAMP,
    Car_Speed DECIMAL(5,2),
    Engine_RPM INT,
    Current_Fuel_Level DECIMAL(5,2),
    Gear_Selected INT,
    PRIMARY KEY (GP_Name, Constructor_Name, Chassis_Serial_Number, Session_Type),
    FOREIGN KEY (GP_Name) REFERENCES GRAND_PRIX(GP_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Constructor_Name, Chassis_Serial_Number) REFERENCES CAR(Constructor_Name, Chassis_Serial_Number) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

Primary keys correspond to IDs, unless otherwise specified. Foreign keys are identified by # and have the same name as the primary keys to which they refer.
Foreign keys must refer to existing primary keys: provide the insert statements in the correct order (first the tables without foreign keys, then the tables in which the foreign keys refer to primary keys in tables that have already been filled in).

CONSTRUCTOR: 11 rows (the 11 official F1 constructors).
DRIVER: 22 rows (the 22 official starting drivers).
CIRCUIT: 24 rows (24 well-known circuits).
GRAND_PRIX: 24 rows (1 per circuit).
POWER_UNIT: 22 rows.
CAR: 22 rows (2 cars per constructor).
RESULT: 528 rows (the 22 drivers participating in the 24 Grands Prix).
PIT_STOP: 50 rows (several pit stops distributed across the races).
TELEMETRY_SESSION: 50 rows (various speed/RPM readings during the races).

The data must be realistic (using real F1 drivers, teams, and circuits) and must comply with the following validation constraints:
ALTER TABLE RESULT 
ADD CONSTRAINT chk_fastest_lap_format 
CHECK (Fastest_Lap_Time LIKE '_:__.__' OR Fastest_Lap_Time LIKE '__:__.__');

ALTER TABLE TELEMETRY_SESSION 
ADD CONSTRAINT chk_session_type 
CHECK (Session_Type IN ('FP1', 'FP2', 'FP3', 'Q1', 'Q2', 'Q3', 'Sprint', 'Race'));

-
ALTER TABLE PIT_STOP 
ADD CONSTRAINT chk_tires_fitted 
CHECK (Tires_Fitted IN ('Soft', 'Medium', 'Hard', 'Intermediate', 'Wet'));


ALTER TABLE RESULT 
ADD CONSTRAINT chk_race_status 
CHECK (Status IN ('Finished', 'DNF', 'DSQ', 'DNS'));


ALTER TABLE DRIVER 
ADD CONSTRAINT chk_driver_number 
CHECK (Permanent_Number BETWEEN 1 AND 99);

ALTER TABLE TELEMETRY_SESSION 
ADD CONSTRAINT chk_gear_selected 
CHECK (Gear_Selected BETWEEN 0 AND 8);

ALTER TABLE RESULT 
ADD CONSTRAINT chk_positive_points 
CHECK (Championship_Points_Earned >= 0);

ALTER TABLE DRIVER 
ADD CONSTRAINT chk_positive_podiums 
CHECK (Total_Career_Podiums >= 0);

ALTER TABLE POWER_UNIT 
ADD CONSTRAINT chk_positive_mileage 
CHECK (PU_Current_Mileage >= 0);

ALTER TABLE PIT_STOP 
ADD CONSTRAINT chk_pit_stop_logic 
CHECK (Total_Pit_Lane_Duration > Pit_Stop_Stationary_Duration);

Provide the set in the form of an SQL script ready to be executed and saved as 3_insertion.sql

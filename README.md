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



LDM from looping : 

DRIVER = (Permanent_Number VARCHAR(50), First_Name VARCHAR(50), Last_Name VARCHAR(50), Nationality VARCHAR(50), Date_of_Birth VARCHAR(50), Total_Career_Podiums VARCHAR(50));
CONSTRUCTOR = (Constructor_Name VARCHAR(50));
CIRCUIT = (Circuit_Name VARCHAR(50), Circuit_Location VARCHAR(50), Circuit_Length VARCHAR(50));
GRAND_PRIX = (GP_Name VARCHAR(50), GP_Date VARCHAR(50), Total_Race_Laps VARCHAR(50), #Circuit_Name);
POWER_UNIT = (PU_ID VARCHAR(50), PU_Current_Mileage VARCHAR(50), PU_Maximum_RPM VARCHAR(50));
CAR = (#Constructor_Name, Chassis_Serial_Number VARCHAR(50), #PU_ID);
PIT_STOP = (#(#Constructor_Name, Chassis_Serial_Number), #GP_Name, Pit_Stop_Lap_Number VARCHAR(50), Pit_Stop_Stationary_Duration VARCHAR(50), Total_Pit_Lane_Duration VARCHAR(50), Tires_Fitted VARCHAR(50));
TELEMETRY_SESSION = (#GP_Name, #(#Constructor_Name, Chassis_Serial_Number), Session_Type VARCHAR(50), Telemetry_Timestamp VARCHAR(50), Car_Speed VARCHAR(50), Engine_RPM VARCHAR(50), Current_Fuel_Level VARCHAR(50), Gear_Selected VARCHAR(50));
RESULT_ = (#Permanent_Number, #Constructor_Name, #GP_Name, Race_Finishing_Position VARCHAR(50), Championship_Points_Earned VARCHAR(50), Fastest_Lap_Time VARCHAR(50), Status VARCHAR(50));


Prompt Fourth Step :

Provide the insertion queries used to populate the database, whose relational model is as follows:

CONSTRUCTOR (Constructor_Name(PK))
DRIVER (Permanent_Number(PK), First_Name, Last_Name, Nationality, Date_of_Birth, Total_Career_Podiums)
CIRCUIT (Circuit_Name(PK), Circuit_Location, Circuit_Length)
POWER_UNIT (PU_ID(PK), PU_Current_Mileage, PU_Maximum_RPM)
GRAND_PRIX (GP_Name(PK), GP_Date, Total_Race_Laps, #Circuit_Name)
CAR (#Constructor_Name(PK), Chassis_Serial_Number(PK), #PU_ID)
PIT_STOP (#Constructor_Name(PK), #Chassis_Serial_Number(PK), #GP_Name(PK), Pit_Stop_Lap_Number(PK), Pit_Stop_Stationary_Duration, Total_Pit_Lane_Duration, Tires_Fitted)
TELEMETRY_SESSION (#GP_Name(PK), #Constructor_Name(PK), #Chassis_Serial_Number(PK), Telemetry_Timestamp(PK), Session_Type, Car_Speed, Engine_RPM, Current_Fuel_Level, Gear_Selected)
RESULT_ (#Permanent_Number(PK), #Constructor_Name(PK), #GP_Name(PK), Race_Finishing_Position, Championship_Points_Earned, Fastest_Lap_Time, Status)

Primary keys correspond to IDs and are marked with (PK). Foreign keys are identified by # and have the same name as the primary keys to which they refer.

There must be a significant amount of data:
- 10 rows for the CONSTRUCTOR table (use realistic F1 team names like Ferrari, Mercedes, Red Bull, etc.).
- 20 rows for the DRIVER table (each driver assigned a unique permanent number). Make sure that the drivers' first and last names refer to various origins and nationalities.
- 10 rows for the CIRCUIT table (real-world tracks).
- 30 rows for the POWER_UNIT table.
- 10 rows for the GRAND_PRIX table.
- 20 rows for the CAR table (exactly 2 cars per Constructor).
- At least 50 rows for PIT_STOP.
- At least 100 rows for TELEMETRY_SESSION (mixing different Session_Types like 'FP1', 'Q3', 'Race').
- At least 100 rows for RESULT_ (reflecting race outcomes for different drivers and constructors).

Foreign keys must refer to existing primary keys: provide the lines starting with filling in the tables in which there are no foreign keys (CONSTRUCTOR, DRIVER, CIRCUIT, POWER_UNIT), then the tables in which the foreign keys refer to primary keys in tables that have already been filled in.

The data must strictly comply with the following validation constraints:
- DRIVER: Total_Career_Podiums >= 0, Permanent_Number > 0
- CIRCUIT: Circuit_Length > 0
- GRAND_PRIX: Total_Race_Laps > 0
- POWER_UNIT: PU_Current_Mileage >= 0, PU_Maximum_RPM > 0 AND PU_Maximum_RPM <= 15000
- PIT_STOP: Total_Pit_Lane_Duration >= Pit_Stop_Stationary_Duration, Tires_Fitted IN ('Soft', 'Medium', 'Hard', 'Intermediate', 'Wet'), Pit_Stop_Lap_Number > 0
- TELEMETRY_SESSION: Gear_Selected BETWEEN -1 AND 8, Car_Speed >= 0
- RESULT_: Championship_Points_Earned >= 0, Race_Finishing_Position > 0

Provide the set in the form of an SQL script ready to be executed, grouped by table. Do not insert any markdown formatting other than the final code block.


Step V : usage scenario :

The main user of this database is the team's Race Strategist. Their goal is to analyze historical and telemetry data to optimize performance for upcoming Grands Prix. They need to extract the following information: the reliability of our Power Units, the efficiency of our pit stops compared to competitors, the top speeds reached during different sessions, and the overall standings of our drivers. This data will allow them to make crucial decision.

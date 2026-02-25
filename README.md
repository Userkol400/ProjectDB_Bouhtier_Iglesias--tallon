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

In accordance with the instructions, this model includes the following advanced elements:

n-ary relationship (n>2): The Result relationship links the Driver entity, the Car (or Constructor) entity, and the Grand Prix entity.

Weak entity / Strong entity: The Pit Stop entity is a weak entity whose existence depends on the Race strong entity


image MCD looping : 
<img width="1573" height="700" alt="image" src="https://github.com/user-attachments/assets/354b9d0f-9ba0-429b-8975-6e5ceb6ac75c" />




CREATE TABLE CONSTRUCTOR (
    Constructor_Name VARCHAR(50) PRIMARY KEY
);


CREATE TABLE DRIVER (
    Permanent_Number INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Nationality VARCHAR(50),
    Date_of_Birth DATE,
    Total_Career_Podiums INT
);

CREATE TABLE CIRCUIT (
    Circuit_Name VARCHAR(50) PRIMARY KEY,
    Circuit_Location VARCHAR(50),
    Circuit_Length DECIMAL(5,3)
);


CREATE TABLE POWER_UNIT (
    PU_ID VARCHAR(50) PRIMARY KEY,
    PU_Current_Mileage DECIMAL(8,2),
    PU_Maximum_RPM INT
);


CREATE TABLE GRAND_PRIX (
    GP_Name VARCHAR(50) PRIMARY KEY,
    GP_Date DATE,
    Total_Race_Laps INT,
    Circuit_Name VARCHAR(50),
    FOREIGN KEY (Circuit_Name) REFERENCES CIRCUIT(Circuit_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CAR (
    Constructor_Name VARCHAR(50),
    Chassis_Serial_Number VARCHAR(50),
    PU_ID VARCHAR(50),
    PRIMARY KEY (Constructor_Name, Chassis_Serial_Number),
    FOREIGN KEY (Constructor_Name) REFERENCES CONSTRUCTOR(Constructor_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PU_ID) REFERENCES POWER_UNIT(PU_ID) 
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE PIT_STOP (
    Constructor_Name VARCHAR(50),
    Chassis_Serial_Number VARCHAR(50),
    GP_Name VARCHAR(50),
    Pit_Stop_Lap_Number INT,
    Pit_Stop_Stationary_Duration DECIMAL(5,3),
    Total_Pit_Lane_Duration DECIMAL(5,3),
    Tires_Fitted VARCHAR(50),
    PRIMARY KEY (Constructor_Name, Chassis_Serial_Number, GP_Name, Pit_Stop_Lap_Number),
    FOREIGN KEY (Constructor_Name, Chassis_Serial_Number) REFERENCES CAR(Constructor_Name, Chassis_Serial_Number) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (GP_Name) REFERENCES GRAND_PRIX(GP_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TELEMETRY_SESSION (
    GP_Name VARCHAR(50),
    Constructor_Name VARCHAR(50),
    Chassis_Serial_Number VARCHAR(50),
    Session_Type VARCHAR(50),
    Telemetry_Timestamp TIMESTAMP,
    Car_Speed INT,
    Engine_RPM INT,
    Current_Fuel_Level DECIMAL(5,2),
    Gear_Selected INT,
    PRIMARY KEY (GP_Name, Constructor_Name, Chassis_Serial_Number, Telemetry_Timestamp),
    FOREIGN KEY (GP_Name) REFERENCES GRAND_PRIX(GP_Name) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Constructor_Name, Chassis_Serial_Number) REFERENCES CAR(Constructor_Name, Chassis_Serial_Number) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RESULT_ (
    Permanent_Number INT,
    Constructor_Name VARCHAR(50),
    GP_Name VARCHAR(50),
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

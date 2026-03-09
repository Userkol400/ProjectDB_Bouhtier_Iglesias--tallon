
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

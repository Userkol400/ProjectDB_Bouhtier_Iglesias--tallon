
ALTER TABLE DRIVER
    ADD CONSTRAINT chk_driver_podiums CHECK (Total_Career_Podiums >= 0),
    ADD CONSTRAINT chk_driver_number CHECK (Permanent_Number > 0);

ALTER TABLE CIRCUIT
    ADD CONSTRAINT chk_circuit_length CHECK (Circuit_Length > 0);


ALTER TABLE GRAND_PRIX
    ADD CONSTRAINT chk_gp_laps CHECK (Total_Race_Laps > 0);


ALTER TABLE POWER_UNIT
    ADD CONSTRAINT chk_pu_mileage CHECK (PU_Current_Mileage >= 0),
    ADD CONSTRAINT chk_pu_rpm CHECK (PU_Maximum_RPM > 0 AND PU_Maximum_RPM <= 15000);

ALTER TABLE PIT_STOP
    ADD CONSTRAINT chk_pit_durations CHECK (Total_Pit_Lane_Duration >= Pit_Stop_Stationary_Duration),
    ADD CONSTRAINT chk_tires_fitted CHECK (Tires_Fitted IN ('Soft', 'Medium', 'Hard', 'Intermediate', 'Wet')),
    ADD CONSTRAINT chk_lap_number CHECK (Pit_Stop_Lap_Number > 0);


ALTER TABLE TELEMETRY_SESSION
    ADD CONSTRAINT chk_gear CHECK (Gear_Selected BETWEEN -1 AND 8), -- -1 pour Reverse, 0 pour Neutral, 1-8 pour les vitesses
    ADD CONSTRAINT chk_car_speed CHECK (Car_Speed >= 0);


ALTER TABLE RESULT_
    ADD CONSTRAINT chk_points CHECK (Championship_Points_Earned >= 0),
    ADD CONSTRAINT chk_finishing_pos CHECK (Race_Finishing_Position > 0);

CREATE DATABASE UK_ACCIDENTS;
USE  UK_ACCIDENTS;

CREATE TABLE if not exists ACCIDENT_2015
(
Accident_Index VARCHAR(30),
Location_Easting_OSGR INT,
Location_Northing_OSGR INT,
Longitude FLOAT,
Latitude FLOAT,
Police_Force INT,
Accident_Severity INT,
Number_of_Vehicles INT,
Number_of_Casualties INT,
Date DATE,
Day_of_Week INT,
Time TIMESTAMP,
Local_Authority_District INT,
Local_Authority_Highway VARCHAR(40),
first_Road_Class INT,
first_Road_Number INT,
Road_Type INT,
Speed_limit INT,
Junction_Detail INT,
Junction_Control INT,
second_Road_Class INT,
second_Road_Number INT,
Pedestrian_Crossing_Human_Control INT,
Pedestrian_Crossing_Physical_Facilities INT,
Light_Conditions INT,
Weather_Conditions INT,
Road_Surface_Conditions INT,
Special_Conditions_at_Site INT,
Carriageway_Hazards INT,
Urban_or_Rural_Area INT,
Did_Police_Officer_Attend_Scene_of_Accident INT,
LSOA_of_Accident_Location VARCHAR(30)
);

LOAD DATA  INFILE 
'G:\acc.csv'
INTO table ACCIDENT_2015
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM ACCIDENT_2015;

CREATE TABLE VEHICLE_2015
(
Accident_Index VARCHAR(30),
Vehicle_Reference INT,
Vehicle_Type INT,
Towing_and_Articulation INT,
Vehicle_Manoeuvre INT,
Vehicle_Location_Restricted_Lane INT,
Junction_Location INT,
Skidding_and_Overturning INT,
Hit_Object_in_Carriageway INT,
Vehicle_Leaving_Carriageway INT,
Hit_Object_off_Carriageway INT,
first_Point_of_Impact INT,
Was_Vehicle_Left_Hand_Drive INT,
Journey_Purpose_of_Driver INT,
Sex_of_Driver INT,
Age_of_Driver INT,
Age_Band_of_Driver INT,
Engine_Capacity INT,
Propulsion_Code INT,
Age_of_Vehicle INT,
Driver_IMD_Decile INT,
Driver_Home_Area_Type INT,
Vehicle_IMD_Decile INT
);
LOAD DATA  INFILE 
'G:\vehicle.csv'
INTO table ACCIDENT_2015
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
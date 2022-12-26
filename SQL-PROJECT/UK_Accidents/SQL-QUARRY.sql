/*
Evaluate the median severity value of accidents 
caused by various Motorcycles.
*/

select  vt.label,avg(a.Accident_Severity) 
from accident_2015 a
join vehicle_2015 as v
	on a.Accident_Index=v.Accident_Index
join vehicle_type vt 
	on vt.`code`=v.vehicle_type
where vt.label like 'Motorcycle%'
group by 1
    ;


/*
 2. Evaluate Accident Severity and Total Accidents per Vehicle Type
*/

select 
	vt.label as vehicel, 
	v.Vehicle_Type as vehicle_type,
	avg(a.Accident_Severity) as accident_severity ,
	count(v.vehicle_type) as Number_of_accidents
from accident_2015 as a
 join vehicle_2015 as v
	on a.Accident_Index=v.Accident_Index
 join vehicle_type vt 
	on vt.`code`=v.vehicle_type
group by v.Vehicle_Type
order by 3,4 ;

/* 
Calculate the Average Severity by vehicle type.
*/
select 
	vt.label as vehicel, 
	v.Vehicle_Type as vehicle_type,
	avg(a.Accident_Severity) as avg_severity 
from accident_2015 as a
 join vehicle_2015 as v
	on a.Accident_Index=v.Accident_Index
 join vehicle_type vt 
	on vt.`code`=v.vehicle_type
group by v.Vehicle_Type
order by 3 ;

/*
Calculate the Average Severity and Total Accidents by Motorcycle.
*/


select  avg(a.Accident_Severity) as avg_severity, 
count(v.Vehicle_Type) as total_accidents
from accident_2015 a
join vehicle_2015 as v
	on a.Accident_Index=v.Accident_Index
join vehicle_type vt 
	on vt.`code`=v.vehicle_type
where vt.label like 'Motorcycle%'
;

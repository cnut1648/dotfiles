create table classroom
	(building		varchar(15),
	 room_number		varchar(7),
	 capacity		numeric(4,0),
	 primary key (building, room_number)
	);
;-- -. . -..- - / . -. - .-. -.--
use large;
;-- -. . -..- - / . -. - .-. -.--
show tables;
;-- -. . -..- - / . -. - .-. -.--
select *
from SCHEMATA;
;-- -. . -..- - / . -. - .-. -.--
select *
from takes;
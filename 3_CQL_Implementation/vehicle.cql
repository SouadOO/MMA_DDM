--Select keyspace
use ks_user27;

--Create  Family Vehicle and Index
CREATE TABLE Vehicle (
	vehicle_id text PRIMARY KEY,
	status text,
	type text
);

CREATE INDEX Vehicle_status_idx ON ks_user27.vehicle (status);

--Insert Data into Vehicle column family

INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','1','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','2','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','3','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','4','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','5','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','6','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','7','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','8','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','9','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','10','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','11','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','12','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','13','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','14','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','15','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','16','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','17','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','18','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','19','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','20','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','21','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','22','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','23','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','24','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','25','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','26','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','27','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','28','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','29','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','30','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','31','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','32','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','33','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','34','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','35','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','36','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','37','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','38','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','39','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','40','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','41','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','42','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','43','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','44','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','45','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','46','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','47','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','48','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','49','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','50','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','51','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','52','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','53','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','54','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','55','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','56','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','57','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','58','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','59','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','60','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','61','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','62','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','63','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','64','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','65','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','66','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','67','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','68','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','69','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','70','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','71','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','72','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','73','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','74','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','75','Out of order');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','76','maintenance');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Gulliver','77','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Kiwirail','78','Parked');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Mantagi','79','In use');
INSERT INTO Vehicle (vehicle_id, status, type) VALUES ('Ganzmovac','80','Out of order');

--Delete a vehicle 
DELETE FROM Vehicle 
 WHERE vehicle_id='80';

--Update status of vehicle
UPDATE Vehicle
	SET status = 'In use'
	WHERE vehicle_id = '80';
	
--select type of a vehicle
SELECT type FROM Vehicle WHERE vehicle_id='80';

--select available vehicle in station_name
SELECT vehicle_id FROM ks_user27.Vehicle WHERE status = 'Brin';

--Sekect keyspace
use ks_user27;

--Create  Family Driver and index

CREATE TABLE Driver(
	driver_name text PRIMARY KEY,
	password text,
	current_position text,
	skills set<text>,
	mobile text
);
CREATE INDEX driver_current_position_idx ON Driver(current_position);
CREATE INDEX driver_by_skill ON Driver(values(skills));



--Insert Data into Drivertable)

INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Mable Songer','7k9WzMkJ','30',{'Gulliver'},'03069990209');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Rebecca Haveman','4TnSkfTE','not_available',{'Kiwirail','Mantagi','Ganzmovac'},'03069990396');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Truman Coursey','3B2bGjRS','Wembley Central',{'Gulliver','Kiwirail'},'03069990414');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Brynn Shouse','RprqUftC','33',{'Mantagi','Ganzmovac'},'03069990589');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Mittie Mingo','V76nkmqm','Lambeth North',{'Gulliver','Kiwirail'},'03069990197');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Dayna Freed','WLu9QrMm','35',{'Mantagi','Ganzmovac'},'03069990803');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Clara Kitchin','99EvSxEF','not_available',{'Gulliver','Kiwirail'},'03069990305');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Jene Satter','FNBnsYYu','Queen s Park',{'Mantagi','Ganzmovac'},'03069990018');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Ayesha Mcgee','pR3jZjBG','38',{'Gulliver','Kiwirail','Mantagi'},'03069990245');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Charlotte Mickle','8bsR3bhD','not_available',{'Ganzmovac'},'03069990959');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Milly Teston','ymnZ9fNF','40',{'Gulliver','Kiwirail','Mantagi','Ganzmovac'},'03069990974');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Milo Kelley','ZmbyP4mv','41',{'Ganzmovac','Gulliver'},'03069990992');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Chadwick Styles','8AGzzWbR','Edgware Road',{'Gulliver','Kiwirail','Mantagi'},'03069990567');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Hulda Tharrington','fbrC4AKw','43',{'Ganzmovac','Gulliver','Mantagi'},'03069990031');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Shalon Medlin','UuHeBJaQ','not_available',{'Kiwirail','Mantagi'},'03069990794');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Hyo Krier','rE53ScEg','45',{'Ganzmovac','Gulliver'},'03069990025');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Trinidad Yokoyama','ezYWyJHv','46',{'Kiwirail','Mantagi'},'03069990566');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Lanell Hibner','AnZLe6pn','Piccadilly Circus',{'Ganzmovac','Gulliver'},'03069990199');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Mercy Feth','bSBqyLEP','48',{'Kiwirail','Mantagi','Gulliver'},'03069990751');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Thaddeus Attebery','Fbs3fyhh','not_available',{'Ganzmovac','Gulliver','Kiwirail'},'03069990652');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Kacey Brewton','CVuYzWKz','Harlesden',{'Mantagi'},'03069990027');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Brock Trevino','3QFgM5sX','51',{'Ganzmovac','Gulliver','Kiwirail'},'03069990148');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Lenard Letcher','mdqSRQSb','not_available',{'Mantagi'},'03069990842');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Ramiro Yandell','xaQ56Mt7','53',{'Ganzmovac','Gulliver','Kiwirail'},'03069990378');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Osvaldo Halladay','8KakpmZ2','not_available',{'Mantagi','Ganzmovac'},'03069990472');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Rosaline Marshal','FAk9Lnaj','Maida Vale',{'Gulliver','Kiwirail'},'03069990057');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Yuko Etter','F75aAsZK','56',{'Mantagi','Ganzmovac','Gulliver'},'03069990773');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Inga Ratliff','CynVRsGj','not_available',{'Gulliver','Kiwirail'},'03069990455');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Brant Logsdon','sLg8Wpcm','58',{'Mantagi','Ganzmovac'},'03069990838');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Carin Muldoon','Q9wNPd9u','59',{'Gulliver','Kiwirail'},'03069990046');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Hayden Ladwig','XhwUGAWK','Baker Street',{'Mantagi','Ganzmovac','Gulliver'},'03069990434');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Israel Nunemaker','Nqzhf9X6','61',{'Kiwirail','Mantagi'},'03069990293');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Darcy Oyola','Q4TKXJV8','not_available',{'Mantagi','Ganzmovac','Gulliver'},'03069990493');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Misty Mcneese','zTH3j75E','North Wembley',{'Kiwirail'},'03069990241');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Raymond Gahagan','PHDUdehX','64',{'Mantagi','Ganzmovac','Gulliver','Kiwirail'},'03069990056');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Yuette Stainbrook','CBYsW5HU','Waterloo',{'Kiwirail'},'03069990462');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Temeka Scola','p34ttMYe','66',{'Mantagi','Ganzmovac','Gulliver','Kiwirail'},'03069990973');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Ellan Kleis','vywwk4a9','not_available',{'Mantagi','Ganzmovac','Gulliver','Kiwirail'},'03069990807');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Belle Guynn','vbReDNX9','Kensal Green',{'Mantagi','Ganzmovac','Gulliver','Kiwirail'},'03069990417');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Kip Sagucio','qB5XKrCa','69',{'Mantagi','Ganzmovac'},'03069990176');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Ismael Ripple','NcB7hnq3','not_available',{'Ganzmovac','Gulliver','Kiwirail'},'03069990509');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Lorina Willaims','fHyCshh4','71',{'Mantagi','Kiwirail'},'03069990477');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Noah Tibbles','3dLJrF6q','not_available',{'Ganzmovac','Gulliver','Kiwirail'},'03069990878');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Bernita Ludlow','b6HRdjsE','Paddington',{'Mantagi'},'03069990476');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Hoyt Silvers','W6Vu54E6','74',{'Ganzmovac','Gulliver','Kiwirail'},'03069990345');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Bernardine Canales','ALECLzTZ','not_available',{'Mantagi','Ganzmovac'},'03069990248');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Hang Benefiel','rDXHqtgJ','76',{'Gulliver','Kiwirail','Mantagi'},'03069990761');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Nobuko Toribio','W2CcPB9G','77',{'Mantagi','Ganzmovac'},'03069990179');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Tifany Ashley','hjUwbb3Y','Oxford Circus',{'Gulliver','Kiwirail'},'03069990367');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Clementina Goad','HtTTuZC3','79',{'Mantagi','Ganzmovac','Kiwirail'},'03069990072');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Jessie Jepson','ULrMXXsJ','not_available',{'Gulliver','Kiwirail'},'03069990223');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Felix Dubrey','xSyDS4dn','Stonebridge Park',{'Mantagi','Ganzmovac','Gulliver'},'03069990610');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Daisy Parsley','yQvDdc4h','2',{'Kiwirail','Mantagi'},'03069990687');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Dottie Mauldin','psdZQ8pB','Elephant & Castle',{'Mantagi','Ganzmovac','Gulliver'},'03069990309');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Garfield Laverty','rGhaBD8s','4',{'Kiwirail','Gulliver'},'03069990499');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Hilario Cottle','rLcqGecS','not_available',{'Mantagi','Ganzmovac','Gulliver'},'03069990122');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Soraya Lesane','TwaPDDzJ','Kilburn Park',{'Kiwirail','Mantagi'},'03069990211');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Corliss Smyre','pAcYPB7f','7',{'Ganzmovac','Gulliver'},'03069990982');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Gale Chow','CcYhawd8','not_available',{'Kiwirail','Mantagi'},'03069990266');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Kimberlie Ouzts','5FHJWCA3','9',{'Ganzmovac','Gulliver','Kiwirail'},'03069990295');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Timika Sedor','exc22kp6','10',{'Kiwirail','Mantagi'},'03069990285');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Violeta Lee','jydcHWWv','Marylebone',{'Ganzmovac','Gulliver'},'03069990412');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Anneliese Haman','GgyfksV4','12',{'Kiwirail','Mantagi','Ganzmovac'},'03069990544');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Malcolm Maugeri','V4etDN4H','not_available',{'Gulliver'},'03069990977');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Molly Rodiguez','MbwDYvDP','14',{'Kiwirail','Mantagi','Ganzmovac'},'03069990635');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Shirely Engel','uZ5MW2GQ','15',{'Gulliver'},'03069990862');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Bess Dazey','8MYZKjxR','Embankment',{'Kiwirail','Mantagi','Ganzmovac'},'03069990274');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Justine Doubleday','FGzy4BTW','17',{'Gulliver','Kiwirail','Mantagi'},'03069990843');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Brooks Owsley','VexUGah5','not_available',{'Mantagi','Ganzmovac'},'03069990110');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Bruna Pogue','E3MdB4qU','Willesden Junction',{'Gulliver','Kiwirail'},'03069990673');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Sheilah Cimmino','tPHxed74','20',{'Mantagi','Ganzmovac','Kiwirail'},'03069990744');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Vilma Alire','8RbnYN94','not_available',{'Gulliver','Kiwirail'},'03069990646');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Edythe Defrancisco','xWYE4AVn','22',{'Mantagi','Ganzmovac'},'03069990543');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Gabriela Marotta','QgxK3ehv','not_available',{'Gulliver','Kiwirail','Mantagi'},'03069990300');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Delfina Jamieson','9T7Npwvg','Warwick Avenue',{'Ganzmovac'},'03069990365');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Dina Perdomo','Xu2gJKfU','25',{'Gulliver','Kiwirail','Mantagi','Ganzmovac'},'03069990556');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Miss Mounce','3LqKc7UQ','not_available',{'Ganzmovac'},'03069990616');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Evelina Provost','TLV3F937','27',{'Gulliver','Kiwirail','Mantagi'},'03069990043');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Tien Giel','X9cbX2TR','28',{'Ganzmovac','Mantagi'},'03069990671');
INSERT INTO Driver(driver_name, password, current_position, skills,mobile) VALUES('Pearlene Folger','MhNeuHD3','Regent s Park',{'Gulliver','Kiwirail','Mantagi','Ganzmovac'},'03069990027');


-- Delete a Driverfrom the table Driver 

DELETE FROM Driver
	WHERE driver_name = 'Anastasiya Boguslavskaya';


-- Update skills of a driver
​UPDATE Driver
	SET skills = skills+{'Gulliver'}
	WHERE driver_name = 'Anastasiya Boguslavskaya';
	
--Select password of a driver	
​SELECT password 
	FROM Driver
	WHERE driver_name = 'Anastasiya Boguslavskaya'
	
--Update position of a driver	
--to not_available
​UPDATE Driver
	SET current_position = 'NA'
	WHERE driver_name = 'Anastasiya Boguslavskaya';
	
--to vehicle_id
UPDATE Driver
	SET current_position = '80'
	WHERE driver_name = 'Anastasiya Boguslavskaya';
	
--to station_name
UPDATE Driver
	SET current_position = 'Elephant & Castle'
	WHERE driver_name = 'Anastasiya Boguslavskaya';

--Get Drivername available in a station
SELECT driver_name 
	FROM Driver
	WHERE current_position = 'Elephant & Castle';

--Get drivers name with a given skills
SELECT driver_name 
	FROM Driver 
	WHERE skills = 'Gulliver'

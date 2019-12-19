CREATE TABLE "MI182_gppasaporte".client (
	id int4 NOT NULL,
	client_num int4 NULL,
	client_fname varchar(50) NULL,
	client_lname varchar(50) NULL,
	client_initial varchar(5) NULL,
	client_address varchar(50) NULL,
	client_contact int4 NULL,
	CONSTRAINT client_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE "MI182_gppasaporte".employee;

CREATE TABLE "MI182_gppasaporte".employee (
	id serial NOT NULL,
	emp_num int4 NULL,
	emp_fname varchar(50) NULL,
	emp_lname varchar(50) NULL,
	emp_initial varchar(50) NULL,
	emp_address varchar(50) NULL,
	emp_dob timestamp NULL,
	client_id int4 NULL,
	CONSTRAINT employee_withfk_pkey PRIMARY KEY (id),
	CONSTRAINT client_id_fkey FOREIGN KEY (client_id) REFERENCES client(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO "MI182_gppasaporte".client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (1,1,'Heihei','Ecnalubma','X.','5555# Sta. Rosa St. Pateros City',87000);


INSERT INTO "MI182_gppasaporte".client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (2,2,'Amadeus','Volhoski','D.','4514# Reverid St. Tagui City',55555);

INSERT INTO "MI182_gppasaporte".client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (3,3,'Weeeww','Eksdii','W.','42069# Uwu St. Gamer City',6666);

INSERT INTO "MI182_gppasaporte".employee
(emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob, client_id)
VALUES(1, 'Mitsuki', 'Isutsukakushi', 'D.', '5050# Japan St. Manila City', '2021-08-20 00:00:00.000', 1);

INSERT INTO "MI182_gppasaporte".employee
(emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob, client_id)
VALUES (2,'Rejolio','Santiago','J.','5555# Refiro St. Cebu City','2021-09-02 00:00:00.000', 2);


INSERT INTO "MI182_gppasaporte".employee
(emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob)
VALUES (0,'Leticia','Refaula','Z.','7777# Victorious St. Vatican City','2021-07-07 00:00:00.000');



CREATE OR REPLACE PROCEDURE "MI182_gppasaporte".updatecity(empid integer, city character varying)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
update client
set client_address = newaddress
where client_num = empid;
commit;
end;
$procedure$
;
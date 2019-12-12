CREATE TABLE MI182_GPPASAPORTE.employee (
	id integer NOT NULL,
	emp_num integer NULL,
	emp_fname varchar2(50) NULL,
	emp_lname varchar2(50) NULL,
	emp_initial varchar2(50) NULL,
	emp_address varchar2(50) NULL,
	emp_dob timestamp NULL,
	client_id integer NULL,
	CONSTRAINT employee_withfk_pkey PRIMARY KEY (id)
	);

CREATE TABLE MI182_GPPASAPORTE.client (
	id integer NOT NULL,
	client_num integer NULL,
	client_fname varchar(50) NULL,
	client_lname varchar(50) NULL,
	client_initial varchar(5) NULL,
	client_address varchar(50) NULL,
	client_contact integer NULL,
	CONSTRAINT client_pkey PRIMARY KEY (id)
);

ALTER TABLE MI182_GPPASAPORTE.EMPLOYEE ADD CONSTRAINT client_id_fkey FOREIGN KEY (client_id) REFERENCES MI182_GPPASAPORTE.CLIENT(id);

INSERT INTO MI182_GPPASAPORTE.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (1,1,'Heihei','Ecnalubma','X.','5555# Sta. Rosa St. Pateros City',87000);

INSERT INTO MI182_GPPASAPORTE.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (2,2,'Amadeus','Volhoski','D.','4514# Reverid St. Tagui City',55555);

INSERT INTO MI182_GPPASAPORTE.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (3,3,'Weeeww','Eksdii','W.','42069# Uwu St. Gamer City',6666);



INSERT INTO MI182_GPPASAPORTE.employee
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB, CLIENT_ID)
VALUES(1, 1, 'Mitsuki', 'Isutsukakushi', 'D.', '5050# Japan St. Manila City', '03-AUG-17 10.39.09.73 AM', 1);

INSERT INTO MI182_GPPASAPORTE.employee
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB, CLIENT_ID)
VALUES (2, 2, 'Rejolio','Santiago','J.','5555# Refiro St. Cebu City','03-AUG-18 10.39.09.73 AM', 2);

INSERT INTO MI182_GPPASAPORTE.employee
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB, CLIENT_ID)
VALUES (3, 3, 'Leticia','Refaula','Z.','7777# Victorious St. Vatican City','03-AUG-19 10.39.09.73 AM', 3);

CREATE OR REPLACE VIEW MI182_GPPASAPORTE.employee_client
AS SELECT client.id,
    client.client_fname,
    client.client_lname,
    client.client_initial,
    client.client_contact,
    client.client_address
   FROM MI182_GPPASAPORTE.client
     JOIN MI182_GPPASAPORTE.employee ON employee.emp_num = client.client_num;
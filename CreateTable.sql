DROP TABLE directed_by;
DROP TABLE reviewed_by;
DROP TABLE users;
DROP TABLE films;
DROP TABLE directors;

DROP SEQUENCE director_id;
DROP SEQUENCE film_id;
DROP SEQUENCE post_id;

CREATE TABLE directors								--Lab 2			
(
	d_id INT NOT NULL PRIMARY KEY,
	d_name VARCHAR(40) NOT NULL,
	spouse VARCHAR(40),
	dob DATE,
	country VARCHAR(20)
);
CREATE SEQUENCE director_id START WITH 1 INCREMENT BY 1;

CREATE TABLE films
(
	f_id INT NOT NULL,
	f_name VARCHAR(40) NOT NULL,
	release_year NUMERIC(4),
	genre VARCHAR(15),
	country VARCHAR(20),
	PRIMARY KEY(f_id)
);
CREATE SEQUENCE film_id START WITH 1 INCREMENT BY 1;

CREATE TABLE directed_by
(
	f_id INT,
	d_id INT,
	FOREIGN KEY(d_id) REFERENCES directors(d_id) ON DELETE CASCADE,
	FOREIGN KEY(f_id) REFERENCES films(f_id) ON DELETE CASCADE,
	PRIMARY KEY(f_id, d_id)
);

CREATE TABLE users
(
	username VARCHAR(10) NOT NULL PRIMARY KEY,
	fullname VARCHAR(20) NOT NULL,
	email VARCHAR(20),
	dob DATE,
	password VARCHAR(15),
	reg_date DATE
);

CREATE TABLE reviewed_by
(
	p_id INT NOT NULL PRIMARY KEY,
	f_id INT,
	username VARCHAR(10),
	title VARCHAR(50),
	rating INT,
	review VARCHAR(300),
	r_date DATE,
	FOREIGN KEY(f_id) REFERENCES films(f_id) ON DELETE CASCADE,
	FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE
);
CREATE SEQUENCE post_id START WITH 1 INCREMENT BY 1;

--Lab 09

CREATE OR REPLACE TRIGGER review_check BEFORE INSERT OR UPDATE ON reviewed_by
FOR EACH ROW
DECLARE
	min_r reviewed_by.rating%type := 1;
	max_r reviewed_by.rating%type := 10;
BEGIN
	IF :NEW.rating > max_r OR :NEW.rating < min_r THEN
	RAISE_APPLICATION_ERROR(-20000, 'The rating is too small or large');
	END IF;
END;
/

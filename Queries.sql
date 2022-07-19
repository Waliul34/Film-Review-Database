set pagesize 70;
set lines 100;

--Lab 2

SELECT * from films;

ALTER TABLE films ADD avg_rating NUMBER(3, 1) DEFAULT 0;

ALTER TABLE films RENAME COLUMN avg_rating to average_rating;

SELECT * from films;

ALTER TABLE films MODIFY f_name VARCHAR(45);

ALTER TABLE films DROP COLUMN average_rating;

SELECT * from films;

SELECT * from reviewed_by;

UPDATE reviewed_by SET rating = 8 WHERE p_id = 7;

SELECT * from reviewed_by;


--Lab 3

SELECT DISTINCT(f_id) film_id FROM reviewed_by;

SELECT f_name, release_year FROM films WHERE release_year >= 1995 AND release_year <= 2000;   --release_year BETWEEN 1995 AND 2000

SELECT f_name, release_year FROM films WHERE release_year IN(2017, 2007, 2000, 2022) ORDER BY release_year, f_name;


--Lab 4

SELECT d_name FROM directors WHERE d_name LIKE '%Coen';		
SELECT d_name FROM directors WHERE d_name LIKE 'Jo__ %';			

SELECT f_id, CAST(AVG(rating) AS NUMBER(3, 1)) AS "Average Rating" FROM reviewed_by GROUP BY f_id;

SELECT f_id, ROUND(AVG(rating), 2) AS "Average Rating", COUNT(p_id) FROM reviewed_by GROUP BY f_id HAVING COUNT(review) >= 2;


--Lab 5

SELECT f.f_id, f.f_name Films_Directed_By_Joel_Coen FROM films f WHERE f_id IN (SELECT db.f_id FROM directors d, directed_by db WHERE d.d_id = db.d_id AND d.d_name = 'Joel Coen');

SELECT f.f_id, f.f_name FROM films f WHERE f_id IN (SELECT db.f_id FROM directors d, directed_by db WHERE d.d_id = db.d_id AND d.d_name = 'Ethan Coen');

SELECT f.f_id, f.f_name FROM films f WHERE f_id IN (SELECT db.f_id FROM directors d, directed_by db WHERE d.d_id = db.d_id AND d.d_name = 'Ethan Coen') UNION ALL SELECT f.f_id, f.f_name FROM films f WHERE f_id IN (SELECT db.f_id FROM directors d, directed_by db WHERE d.d_id = db.d_id AND d.d_name = 'Joel Coen');

SELECT f.f_id, f.f_name FROM films f WHERE f_id IN (SELECT db.f_id FROM directors d, directed_by db WHERE d.d_id = db.d_id AND d.d_name = 'Ethan Coen') INTERSECT SELECT f.f_id, f.f_name FROM films f WHERE f_id IN (SELECT db.f_id FROM directors d, directed_by db WHERE d.d_id = db.d_id AND d.d_name = 'Joel Coen');

SELECT f.f_id, f.f_name FROM films f WHERE f_id IN (SELECT db.f_id FROM directors d, directed_by db WHERE d.d_id = db.d_id AND d.d_name = 'Joel Coen') MINUS SELECT f.f_id, f.f_name FROM films f WHERE f_id IN (SELECT db.f_id FROM directors d, directed_by db WHERE d.d_id = db.d_id AND d.d_name = 'Ethan Coen');


--Lab 6

SELECT d_id, db.f_id FROM directors d JOIN directed_by db USING(d_id);

SELECT d_name, f_id FROM directors NATURAL JOIN directed_by;

SELECT d_name, f_name FROM directors d JOIN directed_by db USING(d_id) JOIN films f ON db.f_id = f.f_id;

SELECT d_id, d_name, f_id FROM directors LEFT OUTER JOIN directed_by USING(d_id) WHERE f_id IS NULL;


--Lab 7

SET SERVEROUTPUT ON


DECLARE 
	min_rating reviewed_by.rating%type;
BEGIN
	SELECT MIN(rating) INTO min_rating FROM reviewed_by;
	DBMS_OUTPUT.PUT_LINE('The Minimum Rating of a Film Is : ' || min_rating);
EXCEPTION
	WHEN others THEN
	DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


--Lab 8

DECLARE
	CURSOR film_cur IS SELECT f_name, release_year FROM films;
	single_film film_cur%ROWTYPE;
	idx INT;
BEGIN
	OPEN film_cur;
	WHILE film_cur%ROWCOUNT <= 4
	LOOP
		idx := film_cur%ROWCOUNT;
		FETCH film_cur INTO single_film;
		DBMS_OUTPUT.PUT_LINE('Index No. : ' || idx || ', Film Name : ' || single_film.f_name);
	END LOOP;	
	CLOSE film_cur;
END;
/


CREATE OR REPLACE FUNCTION avgRating(name IN films.f_name%TYPE) RETURN NUMBER IS
	avg_rate reviewed_by.rating%type;
	id INT;
BEGIN
	SELECT f_id INTO id FROM films WHERE f_name = name;
	SELECT AVG(rating) INTO avg_rate FROM reviewed_by WHERE f_id = id;
	RETURN NVL(avg_rate, 0);
END;
/

DECLARE
	film_name films.f_name%TYPE;
BEGIN
	film_name := 'Blade Runner 2049';		
	DBMS_OUTPUT.PUT_LINE('The rating of ' || film_name || ' is : ' || avgRating(film_name));
END;
/


--Lab 9

COMMIT;
SELECT p_id, f_id, rating FROM reviewed_by;
DELETE FROM reviewed_by WHERE p_id = 8;
SELECT p_id, f_id, rating FROM reviewed_by;
ROLLBACK;
SELECT p_id, f_id, rating FROM reviewed_by;
SAVEPOINT del;
DELETE FROM reviewed_by WHERE p_id = 8;
SELECT p_id, f_id, rating FROM reviewed_by;
ROLLBACK TO del;
SELECT p_id, f_id, rating FROM reviewed_by;


SELECT SYSTIMESTAMP FROM dual;

SELECT p_id, f_id, rating, r_date FROM reviewed_by;
SELECT p_id, ADD_MONTHS(r_date, -6) six_m_sub FROM reviewed_by WHERE p_id = 8;
SELECT LAST_DAY(r_date) FROM reviewed_by WHERE p_id = 8;

SELECT d_name, EXTRACT(YEAR FROM dob) AS birth_year, EXTRACT(MONTH FROM dob) AS birth_month, EXTRACT(DAY FROM dob) AS birth_date FROM directors;



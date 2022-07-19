--Lab 2

--1
INSERT INTO directors(d_id, d_name, spouse, dob, country) VALUES(director_id.NEXTVAL, 'Denis Villeneuve', 'Tanya Lapointe', TO_DATE('03-OCT-1967'), 'Canada'); 
INSERT INTO directors VALUES(director_id.NEXTVAL, 'Ethan Coen', 'Tricia Cooke', TO_DATE('21-09-1957', 'DD-MM-YYYY'), 'USA');
INSERT INTO directors VALUES(director_id.NEXTVAL, 'Joel Coen', 'Frances McDormand', TO_DATE('29-NOV-1954'), 'USA');
--4
INSERT INTO directors VALUES(director_id.NEXTVAL, 'Nicolas Winding Refn', 'Liv Corfixen', TO_DATE('29-SEP-1954'), 'Denmark');
INSERT INTO directors VALUES(director_id.NEXTVAL, 'John Carney', '', TO_DATE('01-JUNE-1972'), 'Ireland');
INSERT INTO directors VALUES(director_id.NEXTVAL, 'Christopher Nolan', 'Emma Thomas', TO_DATE('30-JULY-1970'), 'UK');
--7
INSERT INTO directors VALUES(director_id.NEXTVAL, 'David Fincher', 'Cean Chaffin', TO_DATE('28-AUG-1962'), 'USA');
INSERT INTO directors VALUES(director_id.NEXTVAL, 'Quentin Tarantino', 'Daniella Pick', TO_DATE('27-MAR-1963'), 'USA');
INSERT INTO directors VALUES(director_id.NEXTVAL, 'Jovak Tarkovsky', 'Fikran Bojovik', TO_DATE('15-FEB-1969'), 'Russia');


--1
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Blade Runner 2049', 2017, 'Sci-Fi', 'USA');
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Arrival', 2016, 'Sci-Fi', 'USA');
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Prisoners', 2013, 'Thriller', 'USA');
--4
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'The Tragedy of Macbeth', 2021, 'Drama', 'USA');
--5
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Fargo', 1996, 'Crime', 'USA');
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'No Country For Old Men', 2007, 'Crime', 'USA');
--7
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Sing Street', 2016, 'Coming-of-Age', 'Ireland, UK and USA');
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Once', 2007, 'Musical', 'Ireland');
--9
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Interstellar', 2014, 'Sci-Fi', 'UK and USA');
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Following', 1998, 'Crime', 'UK');
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Memento', 2000, 'Mystery', 'USA');
--12
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Zodiac', 2007, 'Mystery', 'USA');
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Se7en', 1995, 'Thriller', 'USA');
--14
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Pulp Fiction', 1994, 'Crime', 'USA');
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Reservoir Dogs', 1992, 'Crime', 'USA');
--16
INSERT INTO films(f_id, f_name, release_year, genre, country) VALUES(film_id.NEXTVAL, 'Not Yet Made', 2023, 'Unknown', 'USA');



INSERT INTO directed_by VALUES(1, 1);
INSERT INTO directed_by VALUES(2, 1);
INSERT INTO directed_by VALUES(3, 1);
INSERT INTO directed_by VALUES(4, 3);
INSERT INTO directed_by VALUES(5, 2);
INSERT INTO directed_by VALUES(5, 3);
INSERT INTO directed_by VALUES(6, 2);
INSERT INTO directed_by VALUES(6, 3);
INSERT INTO directed_by VALUES(7, 5);
INSERT INTO directed_by VALUES(8, 5);
INSERT INTO directed_by VALUES(9, 6);
INSERT INTO directed_by VALUES(10, 6);
INSERT INTO directed_by VALUES(11, 6);
INSERT INTO directed_by VALUES(12, 7);
INSERT INTO directed_by VALUES(13, 7);
INSERT INTO directed_by VALUES(14, 8);
INSERT INTO directed_by VALUES(15, 8);
INSERT INTO directed_by VALUES(16, 2);



INSERT INTO users VALUES('red_dredd', 'Waliul Islam Sumon', '00waliul00@gmail.com', TO_DATE('15-FEB-2000'), 'wali1234', TO_DATE('25-NOV-2019'));
INSERT INTO users VALUES('fuad32', 'Fuad Hossain', 'fuad32@gmail.com', TO_DATE('04-MAR-2000'), 'fuad00', TO_DATE('03-Jan-2022'));
INSERT INTO users VALUES('fahim41', 'Fahim Shakil', 'fahim41@gmail.com', TO_DATE('6-SEP-1999'), 'fahimsha', TO_DATE('09-FEB-2021'));
INSERT INTO users VALUES('ed_king', 'Rashedul Ghani', 'rghani@gmail.com', TO_DATE('19-NOV-1998'), 'ed_rash', TO_DATE('14-JUL-2022'));


--1
INSERT INTO reviewed_by VALUES(post_id.NEXTVAL, 1, 'red_dredd', 'Best Sci-Fi Out There', 10, 'You should watch this film.', SYSDATE);
INSERT INTO reviewed_by VALUES(post_id.NEXTVAL, 1, 'fuad32', 'Quite Decent Film', 8, 'Watch this to experience something unique.', SYSDATE);
INSERT INTO reviewed_by VALUES(post_id.NEXTVAL, 1, 'fahim41', 'Must Watch Film', 10, 'It''s a must watch film', SYSDATE);
--4
INSERT INTO reviewed_by VALUES(post_id.NEXTVAL, 7, 'red_dredd', 'Stole My Heart', 10, 'A musical that will steal your heart.', SYSDATE);
--5
INSERT INTO reviewed_by VALUES(post_id.NEXTVAL, 9, 'fuad32', 'Very Good Film', 9, 'I personally prefer sci-fi with emotion, and this film provides it.', SYSDATE);
--6
INSERT INTO reviewed_by VALUES(post_id.NEXTVAL, 15, 'fahim41', 'Quite gore, but enjoyable', 7, 'It is full of blood, but the film was enjoyable.', SYSDATE);
INSERT INTO reviewed_by VALUES(post_id.NEXTVAL, 7, 'fahim41', 'Average Film with Good Music', 6, 'The movie was average but the songs were good.', SYSDATE);
INSERT INTO reviewed_by VALUES(post_id.NEXTVAL, 13, 'fuad32', 'Good thriller.', 9, 'I personally liked this film.', SYSDATE);

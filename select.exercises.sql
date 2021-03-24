-- Opening the albums_db database for this sequel exercise.

Use albums_db;

-- Quesiton 3
-- 3(a) the albums database has 31 rows shown by the code below
Select * 
from albums
-- 3(b) the albums database has 23 unique artist names shown by the code below
Select distinct artist 
from albums;
-- 3(c) The primary key for the albums table is PRI shown by the code below
DESCRIBE albums; 
-- 3(d) The oldest released as shown by the code below using either 
-- the ascending or descending sort commands can be seen as 1967 being the oldes
-- and 2011 being the newest
Select *
from albums
Order by release_date asc;

Select *
from albums
Order by release_date desc;

-- Question 4
-- 4(a) The names of the albums done by Pink Floyd are Darkside of 
-- the Moon and The Wall as shown by the code below
Select *
from albums
Where artist = 'Pink Floyd';
-- 4(b) The code below returns only the song Sgt. Pepper's Lonely Hearts Club Band and we can see the
-- release date is 1967
Select *
from albums 
Where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 4(c) By returning only the album Nevermind with the code below we can easily
-- read the genre as Grunge + alternative rock
Select *
from albums 
Where name = "Nevermind";
-- 4(d) Running the code below using the Between command to represent the 1990s
-- shows us 11 albums that were released in this time period. 
-- The Albums: The Bodyguard, Jagged Little Pill, Come on Over, Falling into You, 
-- Let's Talk About Love, Dangerous, The Immaculate Collection, Titanic: Music from the Motion Picture,
-- Metallica, Nevermind, Supernatural 
Select *
from albums 
Where release_date between 1990 and 1999;
--4(e) Using the where clause and the less than operator we can see 13 albums had less 
-- than 20 million in certified sales.
-- The ablums: Grease: The Original Soundtrack from the Moti..., Bad, Sgt. Pepper's Lonely Hearts Club Band
-- Dirty Dancing, Let's Talk About Love, Dangerous, The Immaculate Collection, Abbey Road, Born in the U.S.A.
-- Brothers in Arms, Titanic: Music From The Motion Picture, Nevermind, The Wall
Select *
from albums
Where sales < 20.0;
--4(f) It will not be included because each string is a unique idetifier, such as 'Rock' 
-- != 'Hard Rock' and is != 'Progressive Rock'. Therefore the string rock will not return 
-- any other values other than "Rock".






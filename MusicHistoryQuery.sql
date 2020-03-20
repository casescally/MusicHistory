--Query all of the entries in the Genre table
SELECT * FROM Genre;

--In the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist ( ArtistName, YearEstablished) 
VALUES ('Green Day', 1987);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table
INSERT INTO Album (Title, ReleaseDate, AlbumLength, [Label], ArtistId, GenreId) 
VALUES ('American Idiot', '9/20/2004', 57, 'RepriseRecords', 70, 2);

--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('Holiday', 320, '9/20/2004', 2, 70, 61);

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
--Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title, al.Title, art.ArtistName FROM Album al 
LEFT JOIN Artist art ON art.Id = al.ArtistId
LEFT JOIN Song s ON s.ArtistId = al.ArtistId
WHERE al.Id = 20

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(AlbumId) AS 'Song Count', a.Title
from Song s
LEFT JOIN Album a ON s.AlbumId = a.Id
GROUP BY AlbumId, a.Title;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT (ArtistId) AS 'Song Count', art.ArtistName
from Song s
LEFT JOIN Artist art ON s.ArtistId = art.Id
GROUP BY ArtistId, art.ArtistName;

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT (GenreId) AS 'Song Count', g.[Label]
from Song s
LEFT JOIN Genre g on s.GenreId = g.Id
GROUP BY GenreId, g.[Label];

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title, AlbumLength as 'Album Length'
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength)
FROM Album);

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title, SongLength as 'Song Length'
FROM Song
WHERE SongLength = (SELECT MAX(SongLength)
FROM Song);

--Modify the previous query to also display the title of the album.
SELECT s.Title, a.Title, SongLength as 'Song Length'
FROM Song s
LEFT JOIN Album a on s.AlbumId = a.Id
WHERE SongLength = (SELECT MAX(SongLength)
FROM Song);
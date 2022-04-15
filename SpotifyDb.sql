CREATE DATABASE SpotifyDb

USE SpotifyDb


CREATE TABLE Artists(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(255)
)

CREATE TABLE Albums(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(255),
    ReleaseDate INT, 
    ArtistId INT REFERENCES Artists(Id)
)

CREATE TABLE Musics(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(255),
    Streams INT,
    Duration INT,
    AlbumId INT REFERENCES Albums(Id)
)

CREATE TABLE ArtistMusics(
    Id INT PRIMARY KEY IDENTITY,
    ArtistId INT REFERENCES Artists(Id),
    MusicId INT REFERENCES Musics(Id)
)

CREATE VIEW v_GetAllMusicInfo 

AS

SELECT Musics.Name AS MusicName, Musics.Duration, Artists.Name AS ArtistName, Albums.Name AS AlbumName

FROM Musics

JOIN ArtistMusics
ON ArtistMusics.AlbumId = Albums.Id

JOIN Artists
ON Artists.Id=ArtistMusics.ArtistsId

JOIN Albums
ON albums.Id=Musics.Id

SELECT * from v_GetAllMusicInfo
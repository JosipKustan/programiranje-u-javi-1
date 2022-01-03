	CREATE DATABASE GetMeMovie
GO
USE GetMeMovie
GO
-----------------------------------------------------
-- Creating MOVIE stuff
-----------------------------------------------------
CREATE TABLE Movie
(
	IDMovie INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(300),
	OrgTitle NVARCHAR(300),
	TrailerLink NVARCHAR(300),
	Genre NVARCHAR(100),
	Duration INT,
	MovieDescription NVARCHAR(900),
	PicturePath NVARCHAR(200),
	PublishedDate NVARCHAR(90),
)

GO

CREATE PROCEDURE createMovie
	@Title NVARCHAR(300),
	@TrailerLink NVARCHAR(300),
	@OrgTitle NVARCHAR(300),
	@Genre NVARCHAR(100),
	@Duration INT,
	@MovieDescription NVARCHAR(900),
	@PicturePath NVARCHAR(90),
	@PublishedDate NVARCHAR(90),
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO Movie VALUES(@Title,@OrgTitle, @TrailerLink, @Genre, @Duration, @MovieDescription, @PicturePath, @PublishedDate)
	SET @Id = SCOPE_IDENTITY()
END
GO
CREATE PROCEDURE updateMovie

	@IdMovie INT,
	@Title NVARCHAR(300),
	@OrgTitle NVARCHAR(300),
	@TrailerLink NVARCHAR(300),
	@Genre NVARCHAR(100),
	@Duration INT,
	@MovieDescription NVARCHAR(900),
	@PicturePath NVARCHAR(90),
	@PublishedDate NVARCHAR(90)
	 
AS 
BEGIN 
	UPDATE Movie SET 
		Title = @Title,
		OrgTitle = @OrgTitle,
		TrailerLink = @TrailerLink,
		Genre=@Genre,
		Duration=@Duration,
		MovieDescription = @MovieDescription,
		PicturePath = @PicturePath,
		PublishedDate = @PublishedDate		
	WHERE 
		IDMovie = @IdMovie
END
GO
CREATE PROCEDURE deleteMovie
	@IdMovie INT	 
AS 
BEGIN 
	DELETE  
	FROM 
			Movie
	WHERE 
		IDMovie = @IdMovie
END
GO

CREATE PROCEDURE selectMovie
	@IdMovie INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Movie
	WHERE 
		IDMovie = @IdMovie
END
GO

CREATE PROCEDURE selectMovies
AS 
BEGIN 
	SELECT * FROM Movie
END
GO

-----------------------------------------------------
-- Creating ACTOR stuff
-----------------------------------------------------

CREATE TABLE Actor
(
	IDActor INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(128),

)
GO
CREATE PROCEDURE createActor
	@Name NVARCHAR(300),
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO Actor VALUES(@Name)
	SET @Id = SCOPE_IDENTITY()
END
GO
CREATE PROCEDURE updateActor
	@Name NVARCHAR(128),
	@IdActor INT
	 
AS 
BEGIN 
	UPDATE Actor SET 
		Name=@Name	
	WHERE 
		IDActor = @IDActor
END
GO
CREATE PROCEDURE deleteActor
	@IdActor INT	 
AS 
BEGIN 
	DELETE  
	FROM 
			Actor
	WHERE 
		IDActor = @IdActor
END
GO

CREATE PROCEDURE selectActor
	@IdActor INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Actor
	WHERE 
		IDActor = @IdActor
END
GO

CREATE PROCEDURE selectActors
AS 
BEGIN 
	SELECT * FROM Actor
END

-----------------------------------------------------
-- Creating DIRECOTR stuff
-----------------------------------------------------


GO
CREATE TABLE Director
(
	IDDirector INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(128),

)
GO
CREATE PROCEDURE updateDirector
	@Name NVARCHAR(128),
	@IdDirector INT
	 
AS 
BEGIN 
	UPDATE Director SET 
		Name=@Name	
	WHERE 
		IDDirector = @IDDirector
END
GO
CREATE PROCEDURE deleteDirector
	@IdDirector INT	 
AS 
BEGIN 
	DELETE  
	FROM 
			Director
	WHERE 
		IDDirector = @IdDirector
END
GO

CREATE PROCEDURE selectDirector
	@IdDirector INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Director
	WHERE 
		IDDirector = @IdDirector
END
GO

CREATE PROCEDURE selectDirectors
AS 
BEGIN 
	SELECT * FROM Director
END




-----------------------------------------------------
-- Creating between tables stuff
-----------------------------------------------------
GO
CREATE TABLE MovieDirector
(
	DirectorID int
			constraint DirectorMovie_fk
			references Director,
	MovieID int
			constraint MovieDirector_fk
			references Movie,
    primary key nonclustered (MovieID, DirectorID)

)
GO
CREATE TABLE MovieActor
(
	ActorID int
			constraint ActorMovie_fk
			references Actor,
	MovieID int
			constraint MovieActor_fk
			references Movie,
    primary key nonclustered (MovieID, ActorID)

)
GO


-----------------------------------------------------
-- Inserting MOVIES
-----------------------------------------------------
INSERT INTO Movie
	Values ('Movie1','Movi1','hhttsdfs////dsadsadsad.com','Sad','123','lONG DEsdafdasfdsa','c/fdafdsa/das/dsa/fdsafdsa//dfasfdsa','2011-12-03T10:15:30')

go

Delete from Movie

go 

Call updateMovie ()
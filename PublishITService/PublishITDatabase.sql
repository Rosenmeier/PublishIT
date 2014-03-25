/* User table */

CREATE TABLE [user] (
	[user_id] INT(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[role_id] INT(10) NOT NULL DEFAULT(1) FOREIGN KEY REFERENCES [role]([role_id]),
	[organization_id] INT(10) NOT NULL FOREIGN KEY REFERENCES organization(organization_id),
	name VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	[password] VARBINARY(max) NOT NULL,
	birthday DATE,
	salt VARCHAR(255),
	[status] VARCHAR(10) NOT NULL CHECK([status] IN('active', 'deleted'))
);

/* Media table */

CREATE TABLE [media] (
	[media_id] INT(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[user_id] INT(10) NOT NULL FOREIGN KEY REFERENCES [user](user_id),
	format_id INT(10) NOT NULL FOREIGN KEY REFERENCES [format](format_id),
	title VARCHAR(50) NOT NULL,
	[description] TEXT,
	[date] TIMESTAMP,
	location VARCHAR(125) NOT NULL,
	average_rating FLOAT,
	number_of_downloads INT(5)
);

/* Video table */

CREATE TABLE video (
	video_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	media_id INT(10) NOT NULL FOREIGN KEY REFERENCES media(media_id),
	[length] FLOAT,
	number_of_rents INT(5),
	number_of_trailer_views INT(5)
);

/* Document */

CREATE TABLE document (
	media_id INT(10) NOT NULL FOREIGN KEY REFERENCES [media](media_id),
	published VARCHAR(9) NOT NULL CHECK([status] IN('published', 'private'))
);

/* Genre*/

CREATE TABLE genre (
	genre_id INT(2) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	genre VARCHAR(20)
);

 /* MediaGenre*/

CREATE TABLE media_genre (
	media_id INT(2) NOT NULL FOREIGN KEY REFERENCES [media](media_id),
	genre_id INT(2) NOT NULL FOREIGN KEY REFERENCES [genre](genre_id)
);


CREATE TABLE [format] (
	format_id INT(2) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	media_format VARCHAR(20)
);


CREATE TABLE person (
	person_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	birthday VARCHAR(10)
);


CREATE TABLE profession (
	profession_id INT(3) NOT NULL PRIMARY KEY,
	title VARCHAR(50)
);


CREATE TABLE person_in_video (
	video_id INT NOT NULL FOREIGN KEY REFERENCES video(video_id),
	person_id INT NOT NULL FOREIGN KEY REFERENCES person(person_id),
	profession_id INT(3) NOT NULL FOREIGN KEY REFERENCES profession(professioon_id)
);


CREATE TABLE rent (
	video_id INT NOT NULL FOREIGN KEY REFERENCES video(video_id),
	[user_id] INT NOT NULL FOREIGN KEY REFERENCES [user]([user_id]),
	[start_date] DATETIME NOT NULL,
	[end_date] DATETIME NOT NULL,
);


CREATE TABLE rating (
	[user_id] INT NOT NULL FOREIGN KEY REFERENCES [user]([user_id]),
	[media] INT NOT NULL FOREIGN KEY REFERENCES [media]([media_id]),
	rating INT(2) NOT NULL
);


CREATE TABLE [role] (
	[role_id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[role] VARCHAR(50)
);


CREATE TABLE organization (
	organization_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	organizatin VARCHAR(50)
);
/* User table */

CREATE TABLE [user] (
	[user_id] INT(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[role_id] INT(10) NOT NULL DEFAULT(1) FOREIGN KEY REFERENCES role(role_id),
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
	genre_id int(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	genre VARCHAR(20)
);

 /* MediaGenre*/

CREATE TABLE media_genre (
	media_id INT(2) NOT NULL FOrEIGN KEY REFERENCES [media](media_id),
	genre_id INT(2) NOT NULL FOREIGN KEY REFERENCES [genre](genre_id),
);



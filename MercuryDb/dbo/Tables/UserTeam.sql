CREATE TABLE [dbo].[UserTeam]
(
	[UserId] INT NOT NULL,
	[TeamId] INT NOT NULL,
	FOREIGN KEY (UserId) REFERENCES [User](Id),
	FOREIGN KEY (TeamId) REFERENCES Team(Id),
	PRIMARY KEY (UserId, TeamId)
)

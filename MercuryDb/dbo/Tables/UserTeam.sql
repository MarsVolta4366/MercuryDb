﻿CREATE TABLE [dbo].[UserTeam]
(
	[UserId] INT NOT NULL,
	[TeamId] INT NOT NULL,
	FOREIGN KEY (UserId) REFERENCES [User](Id) ON DELETE CASCADE,
	FOREIGN KEY (TeamId) REFERENCES Team(Id) ON DELETE CASCADE,
	PRIMARY KEY (UserId, TeamId)
)

CREATE TABLE [dbo].[Ticket]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[ProjectId] INT NOT NULL,
	[UserId] INT NULL,
	[StatusId] INT NOT NULL,
	[SprintId] INT NULL,
	[Title] VARCHAR (100) NOT NULL,
	[Content] VARCHAR (1000) NULL,
	[Points] INT NULL,
	FOREIGN KEY (ProjectId) REFERENCES Project(Id) ON DELETE CASCADE,
	FOREIGN KEY (UserId) REFERENCES [User](Id) ON DELETE CASCADE,
	FOREIGN KEY (StatusId) REFERENCES [Status](Id) ON DELETE CASCADE,
	-- Don't delete ticket on sprint deletion, just want sprint id to turn null.
	FOREIGN KEY (SprintId) REFERENCES [Sprint](Id)
)

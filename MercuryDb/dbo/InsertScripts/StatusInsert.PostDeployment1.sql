/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF NOT EXISTS (SELECT * FROM [dbo].[Status]
WHERE Id = 1
	OR Id = 2
	OR Id = 3)
INSERT INTO [dbo].[Status] ([Id], [Title])
VALUES 
	(1, 'Open'),
	(2, 'In Progress'),
	(3, 'Done')
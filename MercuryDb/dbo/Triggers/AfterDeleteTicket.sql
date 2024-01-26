CREATE TRIGGER [AfterDeleteTicket]
ON Ticket
AFTER DELETE
AS
BEGIN
	DECLARE @SprintId int, @Order int, @ProjectId int
	SELECT @SprintId = SprintId, @Order = [Order], @ProjectId = [ProjectId] FROM deleted

	UPDATE Ticket SET [Order] = [Order] - 1
	WHERE
		[Order] > @Order
		AND
		((@SprintId IS NULL AND [SprintId] IS NULL) OR ([SprintId] = @SprintId))
		AND
		[ProjectId] = @ProjectId;
END;
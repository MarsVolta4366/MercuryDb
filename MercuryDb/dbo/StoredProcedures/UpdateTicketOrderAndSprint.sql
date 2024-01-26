--Used when a ticket is dragged and dropped into a new sprint/backlog.
CREATE PROCEDURE [dbo].[UpdateTicketOrderAndSprint]
	@TicketId int,
	@NewOrderValue int,
	@NewSprintId int NULL
AS
	DECLARE @OriginalSprintId int, @OriginalOrderValue int, @ProjectId int;
	SELECT @OriginalSprintId = [SprintId], @OriginalOrderValue = [Order], @ProjectId = [ProjectId] FROM Ticket WHERE Id = @TicketId;

	UPDATE Ticket SET [Order] = [Order] - 1
	WHERE
		[Order] > @OriginalOrderValue
		AND
		((@OriginalSprintId IS NULL AND [SprintId] IS NULL) OR ([SprintId] = @OriginalSprintId))
		AND
		[ProjectId] = @ProjectId;
	UPDATE Ticket SET [Order] = [Order] + 1
	WHERE
		[Order] >= @NewOrderValue
		AND
		((@NewSprintId IS NULL AND [SprintId] IS NULL) OR ([SprintId] = @NewSprintId))
		AND
		[ProjectId] = @ProjectId;

	UPDATE Ticket SET [Order] = @NewOrderValue WHERE Id = @TicketId;
	UPDATE Ticket SET SprintId = @NewSprintId WHERE Id = @TicketId;

	SELECT * FROM Ticket WHERE Id = @TicketId;
--Used when a ticket is dragged to a new order but stays in the same sprint/backlog.
CREATE PROCEDURE [dbo].[UpdateTicketOrder]
	@TicketId int,
	@NewOrderValue int
AS
	DECLARE @SprintId int, @OriginalOrderValue int, @ProjectId int;
	SELECT @SprintId = [SprintId], @OriginalOrderValue = [Order], @ProjectId = [ProjectId] FROM Ticket WHERE Id = @TicketId;

	If @NewOrderValue < @OriginalOrderValue --Moving ticket up in order displayed.
	UPDATE Ticket SET [Order] = [Order] + 1
	WHERE
		[Order] BETWEEN @NewOrderValue and @OriginalOrderValue - 1
		AND
		((@SprintId IS NULL AND [SprintId] IS NULL) OR ([SprintId] = @SprintId))
		AND
		[ProjectId] = @ProjectId;

	If @NewOrderValue > @OriginalOrderValue --Moving ticket down in order displayed.
	UPDATE Ticket SET [Order] = [Order] - 1
	WHERE
		[Order] BETWEEN @OriginalOrderValue + 1 AND @NewOrderValue
		AND
		((@SprintId IS NULL AND [SprintId] IS NULL) OR ([SprintId] = @SprintId))
		AND
		[ProjectId] = @ProjectId;

	UPDATE Ticket SET [Order] = @NewOrderValue WHERE Id = @TicketId;
	SELECT * FROM Ticket WHERE Id = @TicketId;

GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ReservationItem_Delete_ById]
							   @Id int
as

/*
						Declare @Id int = 1
		
		Execute dbo.[ReservationItem_Delete_ById]
										@Id
*/

BEGIN
			  Delete
			  FROM [dbo].[ReservationItem]
			  Where Id = @Id;
End


GO


GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Reservation_Delete_ById]
							   @Id int
as

/*
						Declare @Id int = 5
		
		Execute dbo.[Reservation_Delete_ById]
										@Id
*/

BEGIN
			  Delete
			  FROM [dbo].[Reservation]
			  Where Id = @Id;
End


GO


GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Table_Delete_ById]
							   @Id int
as

/*
						Declare @Id int = 15
		
		Execute dbo.[Table_Delete_ById]
										@Id
		
*/

BEGIN
			  Delete
			  FROM [dbo].[Table]
			  Where Id = @Id;
End


GO


GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ReservationItem_Select_ById]
							@Id int
as

/*
						Declare	@Id int = 9

				Execute dbo.[ReservationItem_Select_ById]
										   @Id
*/

BEGIN
				    SELECT ri.[id]
						  ,dbo.fn_GetUserJSON(UserId) as [UserId]
						  ,[TableId]
						  ,t.Name as TableName
						  ,[Start]
						  ,[End]
						  ,[DateAdded]
						  ,ri.[DateModified]
						  ,dbo.fn_GetUserJSON(ri.CreatedBy) as [CreatedBy]
						  ,dbo.fn_GetUserJSON(ri.ModifiedBy) as [ModifiedBy]
				  FROM [dbo].[ReservationItem] as ri join dbo.[Table] as t
							on ri.TableId = t.id
					Where ri.id = @Id

End
GO

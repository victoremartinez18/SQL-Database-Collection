
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ReservationItem_SelectAll]
							 @PageIndex int
							,@PageSize int
as

/*
						Declare	 @PageIndex int = 0
								,@PageSize int = 10

				Execute dbo.[ReservationItem_SelectAll]
										   @PageIndex
										  ,@PageSize
*/

BEGIN
		Declare @offset int = @PageIndex * @PageSize

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
						  ,TotalCount = COUNT(1) OVER()
				  FROM [dbo].[ReservationItem] as ri join dbo.[Table] as t
							on ri.TableId = t.id
					
					ORDER BY id

				OFFSET @offSet Rows
			Fetch Next @PageSize Rows ONLY

End
GO

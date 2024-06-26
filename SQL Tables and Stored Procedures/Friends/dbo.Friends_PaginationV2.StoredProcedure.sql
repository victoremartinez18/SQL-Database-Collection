
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_PaginationV2]
								@PageIndex int 
								,@PageSize int
	
as
/*
	Declare @PageIndex int = 0
			,@PageSize int = 5

	Execute dbo.Friends_PaginationV2
						@PageIndex 
						,@PageSize
	
*/

BEGIN
	
	Declare @offset int = @PageIndex * @PageSize

	SELECT f.[Id]
      ,[Title]
      ,[Bio]
      ,[Summary]
      ,[Headline]
      ,[Slug]
      ,[StatusId]
	  ,i.Id
	  ,TypeId
	  ,Url
	  ,[UserId]
      ,[DateCreated]
      ,[DateModified]
	  ,TotalCount = COUNT(1) OVER()
      
  FROM [dbo].[FriendsV2] as f inner join dbo.Images as i
			on f.PrimaryImageId = i.Id

  Order By f.Id

	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY
  
END
GO

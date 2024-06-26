
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_Search_PaginationV2]
								@PageIndex int 
								,@PageSize int
								,@Query nvarchar(50)
	
as
/*
	Declare @PageIndex int = 0
			,@PageSize int = 5
			,@Query nvarchar(50) = 'Kayla'

	Execute dbo.Friends_PaginationV2
						@PageIndex 
						,@PageSize
						,@Query
	
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

			WHERE (Title LIKE '%' + @Query + '%')

  Order By f.Id

	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY
  
END
GO

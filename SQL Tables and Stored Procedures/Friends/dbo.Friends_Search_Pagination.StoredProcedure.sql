
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_Search_Pagination]
								@PageIndex int 
								,@PageSize int
								,@Query nvarchar(50)
	
as
/*
	Declare @PageIndex int = 0
			,@PageSize int = 5
			,@Query nvarchar(50) = 'Kayla'

	Execute dbo.Friends_Search_Pagination
						@PageIndex 
						,@PageSize
						,@Query
	
*/

BEGIN
	
	Declare @offset int = @PageIndex * @PageSize

	SELECT [Id]
      ,[Title]
      ,[Bio]
      ,[Summary]
      ,[Headline]
      ,[Slug]
      ,[StatusId]
      ,[PrimaryImageUrl]
	  ,[UserId]
      ,[DateCreated]
      ,[DateModified]
	  ,TotalCount = COUNT(1) OVER()
      
  FROM [dbo].[Friends]

  WHERE (Title LIKE '%' + @Query + '%')

  Order By Id

	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY
  
END
GO

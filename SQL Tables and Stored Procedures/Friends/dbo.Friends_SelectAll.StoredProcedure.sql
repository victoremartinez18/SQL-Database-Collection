
GO
SET QUOTED_IDENTIFIER ON
GO



Create proc [dbo].[Friends_SelectAll]
	
as
/*
	Declare @Id int = 1
	Execute dbo.Friends_SelectAll
		
*/



BEGIN
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
      
  FROM [dbo].[Friends]
  
END
GO

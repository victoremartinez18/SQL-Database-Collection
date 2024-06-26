
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_InsertV2]
			@Title nvarchar(50)
			,@Bio nvarchar(50) 
			,@Summary nvarchar(50)
			,@Headline nvarchar(50)
			,@Slug nvarchar(50)
			,@StatusId int
			,@ImageTypeId int
			,@ImageUrl nvarchar(50)
			,@UserId int
			,@Id int OUTPUT

as
/* --- Test Code ---

	Declare @Id int = 0

	Declare @Title nvarchar(50) = 'John Doe'
		,@Bio nvarchar(50) = 'Bio Text'
		,@Summary nvarchar(50) = 'Summary Text'
		,@Headline nvarchar(50) = 'Headline Text'
		,@Slug nvarchar(50) = 'Slug1234'
		,@StatusId int = 1
		,@UserId int = 12345
		,@ImageTypeId int = 2
		,@ImageUrl nvarchar(50) = 'TestUrL.com'

	Execute dbo.Friends_InsertV2
						@Title
					   ,@Bio
					   ,@Summary
					   ,@Headline
					   ,@Slug
					   ,@StatusId
					   ,@ImageTypeId
					   ,@ImageUrl
					   ,@UserId
					   ,@Id OUTPUT
						
	Select *
	From dbo.FriendsV2
	Select *
	From dbo.Images
*/



BEGIN
	INSERT INTO [dbo].[FriendsV2]
           ([Title]
           ,[Bio]
           ,[Summary]
           ,[Headline]
           ,[Slug]
           ,[StatusId]
		   ,[PrimaryImageId]
		   ,[UserId])
     VALUES
           (@Title
           ,@Bio
           ,@Summary
		   ,@Headline
           ,@Slug
           ,@StatusId
		   ,@Id -- The Id is set in the INSERT INTO [dbo].[Images] above
		   ,@UserId)

		   SET @Id = SCOPE_IDENTITY()
END
GO

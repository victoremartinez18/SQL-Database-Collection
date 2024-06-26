
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_Insert]
			@Title nvarchar(50)
			,@Bio nvarchar(50) 
			,@Summary nvarchar(50)
			,@Headline nvarchar(50)
			,@Slug nvarchar(50)
			,@StatusId int
			,@PrimaryImageUrl nvarchar(50)
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
		,@PrimaryImageUrl nvarchar(50) = 'ImageURL.com'
		,@UserId int = 12345

	Execute dbo.Friends_Insert 
						@Title
					   ,@Bio
					   ,@Summary
					   ,@Headline
					   ,@Slug
					   ,@StatusId
					   ,@PrimaryImageUrl
					   ,@UserId
					   ,@Id OUTPUT
	Select * 
	From dbo.Friends
*/
BEGIN  
	INSERT INTO [dbo].[Friends]
           ([Title]
           ,[Bio]
           ,[Summary]
           ,[Headline]
           ,[Slug]
           ,[StatusId]
           ,[PrimaryImageUrl]
		   ,[UserId])
     VALUES
           (@Title
           ,@Bio
           ,@Summary
		   ,@Headline
           ,@Slug
           ,@StatusId
		   ,@PrimaryImageUrl
		   ,@UserId)

		   SET @Id = SCOPE_IDENTITY()
END
GO

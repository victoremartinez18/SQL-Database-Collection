
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_InsertV3]
			@Title nvarchar(50)
			,@Bio nvarchar(50) 
			,@Summary nvarchar(50)
			,@Headline nvarchar(50)
			,@Slug nvarchar(50)
			,@StatusId int
			,@ImageTypeId int
			,@ImageUrl nvarchar(50)
			,@UserId int
			,@BatchSkills dbo.BatchSkills READONLY
			,@Id int OUTPUT

as
/* --- Test Code ---

	Declare @Id int = 0

	Declare @Title nvarchar(50) = 'Test Friend 2'
		,@Bio nvarchar(50) = 'Bio Text'
		,@Summary nvarchar(50) = 'Summary Text'
		,@Headline nvarchar(50) = 'Headline Text'
		,@Slug nvarchar(50) = 'Slug2'
		,@StatusId int = 1
		,@UserId int = 12345
		,@ImageTypeId int = 1
		,@primaryImage nvarchar(50) = 'TestUrl2'
		,@BatchSkills dbo.BatchSkills

	Insert Into @BatchSkills (Name)
		Values ('Walk')
	Insert Into @BatchSkills (Name)
		Values ('Talk')
	-- Insert Into @BatchSkills (Name)
	-- Values ('Run')

	Execute dbo.[Friends_InsertV3]
						@Title
					   ,@Bio
					   ,@Summary
					   ,@Headline
					   ,@Slug
					   ,@StatusId
					   ,@ImageTypeId
					   ,@primaryImage
					   ,@UserId
					   ,@BatchSkills
					   ,@Id OUTPUT

	Execute dbo.Friends_SelectByIdV3
							@Id					

	Select *
	From dbo.FriendSkills as fs inner join dbo.Skills as s
				on fs.SkillId = s.Id

*/

BEGIN
	INSERT INTO [dbo].[Images]
           ([TypeId]
		   ,[Url])
     VALUES
           (@ImageTypeId
           ,@ImageUrl)

		   SET @Id = SCOPE_IDENTITY()
		   
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

	INSERT INTO dbo.Skills
			(Name)
		SELECT b.Name
			From @BatchSkills as b
		Where NOT EXISTS (
						Select 1 
							From dbo.Skills as s
						Where s.Name = b.Name
		)

	INSERT INTO dbo.FriendSkills
			(FriendId
			,SkillId)
	
		SELECT   @Id
				,s.Id
			From dbo.Skills as s
		Where  Exists (
						Select 1
							From @BatchSkills as b
						Where b.name = s.Name
						)
END
GO

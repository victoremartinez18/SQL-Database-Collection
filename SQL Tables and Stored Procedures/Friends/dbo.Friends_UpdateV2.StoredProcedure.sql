
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_UpdateV2]
			@Title nvarchar(50)
			,@Bio nvarchar(50) 
			,@Summary nvarchar(50)
			,@Headline nvarchar(50)
			,@Slug nvarchar(50)
			,@StatusId int
			,@ImageTypeId int
			,@ImageUrl nvarchar(50)
			,@UserId int
			,@Id int
			
as
/* --- Test Code ---
	Declare @Title nvarchar(50) = 'Pat Santos'
		,@Bio nvarchar(50) = 'Bio Text'
		,@Summary nvarchar(50) = 'Summary Text'
		,@Headline nvarchar(50) = 'Headline Text'
		,@Slug nvarchar(50) = 'Slug1234'
		,@StatusId int = 1
		,@UserId int = 54321
		,@ImageTypeId int = 2
		,@ImageUrl nvarchar(50) = 'Santos.com'
		,@Id int = 5

	Select *
	From dbo.FriendsV2
	Where Id = @Id
	Select i.Id, url, f.Id, Title
	From dbo.Images as i inner join dbo.FriendsV2 as f
		on i.Id = f.PrimaryImageId
		Where f.Id = @Id

	Execute dbo.Friends_UpdateV2
						@Title
					   ,@Bio
					   ,@Summary
					   ,@Headline
					   ,@Slug
					   ,@StatusId
					   ,@ImageTypeId
					   ,@ImageUrl
					   ,@UserId
					   ,@Id
	Select *
	From dbo.FriendsV2
	Where Id = @Id
	Select i.Id, url, f.Id, Title
	From dbo.Images as i inner join dbo.FriendsV2 as f
		on i.Id = f.PrimaryImageId
		Where f.Id = @Id
	select * from dbo.Images
*/

Declare @DateModified datetime2(7) = GETUTCDATE()

Declare @PrimaryImageId int = (Select PrimaryImageId 
										From dbo.FriendsV2
										Where Id = @Id)

BEGIN
	UPDATE [dbo].[FriendsV2]
   SET [Title] = @Title
      ,[Bio] = @Bio
      ,[Summary] = @Summary
      ,[Headline] = @Headline
      ,[Slug] = @Slug
      ,[StatusId] = @StatusId
      ,[DateModified] = @DateModified
      ,[UserId] = @UserId

    WHERE Id = @Id 

UPDATE [dbo].[Images]
   SET [TypeId] = @ImageTypeId
      ,[Url] = @ImageUrl

	  WHERE Id = @PrimaryImageId


	  /*
	  FROM dbo.FriendsV2 as f inner join dbo.Images as i
				on f.PrimaryImageId = i.Id
    WHERE f.Id = @Id

	--------------------------------------------

	  FROM dbo.FriendsV2 as f inner join dbo.Images as i
				on f.PrimaryImageId = i.Id
    WHERE i.Id = f.PrimaryImageId
	*/

END
GO

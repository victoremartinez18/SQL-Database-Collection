
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Friends_SelectAllV3]
	

as
/*
	Execute dbo.Friends_SelectAllV3				
*/

BEGIN
	SELECT f.[Id]
      ,[Title]
      ,[Bio]
      ,[Summary]
      ,[Headline]
      ,[Slug]
      ,[StatusId]
	  ,i.[Id]
	  ,TypeId
	  ,[Url]
	  ,[Skills] = (
			Select s.Name, s.Id
				From dbo.Skills as s inner join dbo.FriendSkills as fs
					on s.Id = fs.SkillId
				Where fs.FriendId = f.Id
				
			For JSON AUTO
					)
	  ,[UserId]
      ,[DateCreated]
      ,[DateModified]
	  
      
  FROM [dbo].[FriendsV2] as f inner join dbo.Images as i
				on f.PrimaryImageId = i.Id
  
END
GO

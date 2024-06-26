
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Table_Insert]
					 @Name nvarchar(100)
					,@VenueId int
					,@AdMainImage nvarchar(255)
					,@Capacity int
					,@Price decimal(18, 2)
					,@StatusTypeId int
					,@CreatedBy int
					,@Id int OUTPUT
					
/*
					Declare	 @Name nvarchar(100) = 'Table4'
							,@VenueId int = 1
							,@AdMainImage nvarchar(255) = 'url.com'
							,@Capacity int = 8
							,@Price decimal(18, 2) = 35.49
							,@StatusTypeId int = 3
							,@CreatedBy int = 1
							,@Id int = 0

		Execute [dbo].[Table_Insert]
							 @Name
							,@VenueId
							,@AdMainImage
							,@Capacity
							,@Price 
							,@StatusTypeId
							,@CreatedBy
							,@Id
*/

as

BEGIN

	INSERT INTO [dbo].[Table]
					([Name]
					,[VenueId]
					,[AdMainImage]
					,[Capacity]
					,[Price]
					,[StatusTypeId]
					,[CreatedBy]
					,[ModifiedBy])
				VALUES
					(@Name
					,@VenueId
					,@AdMainImage
					,@Capacity
					,@Price
					,@StatusTypeId
					,@CreatedBy
					,@CreatedBy)

		SET @Id = SCOPE_IDENTITY()

END
GO

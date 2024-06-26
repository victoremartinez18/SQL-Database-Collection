
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ReservationItem_Insert]
					    @UserId int
					   ,@TableId int
					   ,@Start datetime2(7)
					   ,@End datetime2(7)
					   ,@CreatedBy int
					   ,@Id int OUTPUT


/*
				 Declare	@UserId int = 1
						   ,@TableId int = 2
						   ,@Start datetime2(7) = '2024-04-20'
						   ,@End datetime2(7) = '2024-04-21'
						   ,@CreatedBy int = 1
						   ,@Id int = 0

		Execute [dbo].[ReservationItem_Insert]
							 @UserId
							,@TableId
							,@Start
							,@End
							,@CreatedBy
							,@CreatedBy
							,@Id OUTPUT

*/


as

BEGIN

	   INSERT INTO [dbo].[ReservationItem]
						([UserId]
						,[TableId]
						,[Start]
						,[End]
						,[CreatedBy]
						,[ModifiedBy])
					VALUES
						(@UserId
						,@TableId
						,@Start
						,@End
						,@CreatedBy
						,@CreatedBy)

		SET @Id = SCOPE_IDENTITY()

END






GO

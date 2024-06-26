
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ReservationItem_Update]
					    @UserId int
					   ,@TableId int
					   ,@Start datetime2(7)
					   ,@End datetime2(7)
					   ,@ModifiedBy int
					   ,@Id int

/*
				 Declare	@UserId int = 1
						   ,@TableId int = 3
						   ,@Start datetime2(7) = '2024-04-20'
						   ,@End datetime2(7) = '2024-04-21'
						   ,@DateModified datetime2(7) = '2024-04-01'
						   ,@ModifiedBy int = 1
						   ,@Id int = 1

		Execute [dbo].[ReservationItem_Update]
							 @UserId
							,@TableId
							,@Start
							,@End
							,@DateModified
							,@ModifiedBy
							,@Id
*/

as

BEGIN

		    UPDATE [dbo].[ReservationItem]
					SET	 [UserId] = @UserId
						,[TableId] = @TableId
						,[Start] = @Start
						,[End] = @End
						,[DateModified] = GETUTCDATE()
						,[ModifiedBy] = @ModifiedBy
				Where id = @Id

End
GO

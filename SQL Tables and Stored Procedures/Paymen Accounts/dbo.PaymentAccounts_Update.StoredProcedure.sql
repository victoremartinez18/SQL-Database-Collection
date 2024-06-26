
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[PaymentAccounts_Update]
						@VenueId int
					   ,@AccountId nvarchar(250)
					   ,@PaymentTypeId int
					   ,@UserId int
					   ,@Id int
as

/*
	-- @VenueId (FK from Venues Table) - MISSING TABLE

					Declare	 @VenueId int = 2
							,@AccountId nvarchar(250) = 'Acct from Stripe 2'
							,@PaymentTypeId int = 1
							,@UserId int = 1
							,@Id int = 2

		Execute dbo.[PaymentAccounts_Update]
							 @VenueId
							,@AccountId
							,@PaymentTypeId
							,@UserId
							,@Id

				Select *
				From dbo.PaymentAccounts;
*/

BEGIN
			 UPDATE [dbo].[PaymentAccounts]
			   SET [VenueId] = @VenueId
				  ,[AccountId] = @AccountId
				  ,[PaymentTypeId] = @PaymentTypeId
				  ,[DateModifed] = GETUTCDATE()
				  ,[ModifiedBy] = @UserId
			 WHERE Id = @Id;
End


GO

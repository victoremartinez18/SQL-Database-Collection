
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[PaymentAccounts_Delete_ById]
							   @Id int
as

/*
						Declare @Id int = 1
		Select*
		FROM [dbo].[PaymentAccounts]

		Execute dbo.PaymentAccounts_Delete_ById
										@Id
		Select*
		FROM [dbo].[PaymentAccounts]


*/

BEGIN
			  Delete
			  FROM [dbo].[PaymentAccounts]
			  Where Id = @Id;
End


GO

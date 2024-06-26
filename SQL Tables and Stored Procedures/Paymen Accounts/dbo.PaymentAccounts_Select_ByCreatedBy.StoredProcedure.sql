
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[PaymentAccounts_Select_ByCreatedBy]
									  @UserId int
as

/*
						Declare @UserId int = 1

 Execute dbo.PaymentAccounts_Select_ByCreatedBy
										@UserId
*/

BEGIN
			  SELECT p.[Id]
					,[VenueId]
					,v.Name
					,[AccountId]
					,[PaymentTypeId]
					,pt.Name as PaymentType
					,p.[DateCreated]
					,[DateModifed]
					,dbo.fn_GetUserJSON(p.CreatedBy) as [CreatedBy]
					,dbo.fn_GetUserJSON(p.ModifiedBy) as [ModifiedBy]
					,TotalCount = COUNT(1) OVER()
				FROM [dbo].[PaymentAccounts] as p join dbo.PaymentType as pt
						on p.PaymentTypeId = pt.Id join dbo.Venues as v
							on v.id = p.VenueId
				Where p.CreatedBy = @UserId
End


GO

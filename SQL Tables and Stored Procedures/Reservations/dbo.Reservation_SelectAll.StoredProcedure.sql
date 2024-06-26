
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Reservation_SelectAll]
							 @PageIndex int
							,@PageSize int

as

/*
						Declare	 @PageIndex int = 0
								,@PageSize int = 10

				Execute dbo.[Reservation_SelectAll]
									@PageIndex
									,@PageSize
*/

BEGIN
			Declare @offset int = @PageIndex * @PageSize

				SELECT r.[id]
						,[CouponCode]
						,[DiscountValue]
						,[Total]
						,[ChargeId]
						,[PaymentAccountId]
						,[BillingAddressId]
						,[TableId]
						,t.[Name] as TableName
						,[BookingStatusId]
						,bs.Name as BookingStatus
						,dbo.fn_GetUserJSON(r.CreatedBy) as [CreatedBy]
						,dbo.fn_GetUserJSON(r.ModifiedBy) as [ModifiedBy]
						,TotalCount = COUNT(1) OVER()
				  FROM [dbo].[Reservation] as r join dbo.[Table] as t
							on r.TableId = t.id join dbo.BookingStatus as bs
							on BookingStatusId = bs.id
			
				ORDER BY r.Id

				OFFSET @offSet Rows
			Fetch Next @PageSize Rows ONLY
End
GO

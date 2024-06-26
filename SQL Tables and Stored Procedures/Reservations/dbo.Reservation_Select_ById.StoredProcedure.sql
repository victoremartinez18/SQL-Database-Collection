
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Reservation_Select_ById]
							@Id int

as

/*
						Declare	@Id int = 3

				Execute dbo.[Reservation_Select_ById]
										   @Id
*/

BEGIN
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
				  FROM [dbo].[Reservation] as r join dbo.[Table] as t
							on r.TableId = t.id join dbo.BookingStatus as bs
							on BookingStatusId = bs.id

					Where r.id = @Id
End
GO

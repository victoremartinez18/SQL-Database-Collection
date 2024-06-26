
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Reservation_Update]
						 @CouponCode nvarchar(50)
						,@DiscountValue decimal(18,2)
						,@Total decimal(18,2)
						,@ChargeId nvarchar(200)
						,@PaymentAccountId int
						,@BillingAddressId int
						,@ModifiedBy int
						,@TableId int
						,@BookingStatusId int
						,@Id int
as

/*
					Declare	 @CouponCode nvarchar(50) = 'Testing Coupon Update'
							,@DiscountValue decimal(18,2) = 15
							,@Total decimal(18,2) = 12.18
							,@ChargeId nvarchar(200) = 'chargeIdTest'
							,@PaymentAccountId int = 44
							,@BillingAddressId int = 1
							,@ModifiedBy int = 1
							,@TableId int = 2
							,@BookingStatusId int = 3
							,@Id int = 5

		Execute [dbo].[Reservation_Update]
							 @CouponCode
							,@DiscountValue
							,@Total 
							,@ChargeId 
							,@PaymentAccountId 
							,@BillingAddressId 
							,@ModifiedBy 
							,@TableId 
							,@BookingStatusId
							,@Id
*/

BEGIN
			 UPDATE [dbo].[Reservation]
				   SET [CouponCode] = @CouponCode
					  ,[DiscountValue] = @DiscountValue
					  ,[Total] = @Total
					  ,[ChargeId] = @ChargeId
					  ,[PaymentAccountId] = @PaymentAccountId
					  ,[BillingAddressId] = @BillingAddressId
					  ,[ModifiedBy] = @ModifiedBy
					  ,[TableId] = @TableId
					  ,[BookingStatusId] = @BookingStatusId
			 WHERE Id = @Id;
End


GO

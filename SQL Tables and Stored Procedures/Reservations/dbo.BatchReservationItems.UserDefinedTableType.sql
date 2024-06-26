
CREATE TYPE [dbo].[BatchReservationItems] AS TABLE(
	[UserId] [int] NOT NULL,
	[TableId] [int] NOT NULL,
	[Start] [datetime2](7) NOT NULL,
	[End] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL
)
GO

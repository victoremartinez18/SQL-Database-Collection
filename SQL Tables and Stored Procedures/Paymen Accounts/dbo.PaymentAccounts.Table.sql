
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentAccounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VenueId] [int] NOT NULL,
	[AccountId] [nvarchar](250) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModifed] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_PaymentAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentAccounts] ADD  CONSTRAINT [DF_PaymentAccounts_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[PaymentAccounts] ADD  CONSTRAINT [DF_PaymentAccounts_DateModifed]  DEFAULT (getutcdate()) FOR [DateModifed]
GO
ALTER TABLE [dbo].[PaymentAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PaymentAccounts_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([Id])
GO
ALTER TABLE [dbo].[PaymentAccounts] CHECK CONSTRAINT [FK_PaymentAccounts_PaymentType]
GO
ALTER TABLE [dbo].[PaymentAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PaymentAccounts_Venues] FOREIGN KEY([VenueId])
REFERENCES [dbo].[Venues] ([Id])
GO
ALTER TABLE [dbo].[PaymentAccounts] CHECK CONSTRAINT [FK_PaymentAccounts_Venues]
GO


GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[VenueId] [int] NOT NULL,
	[AdMainImage] [nvarchar](255) NULL,
	[Capacity] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[StatusTypeId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Table_BookingStatus] FOREIGN KEY([StatusTypeId])
REFERENCES [dbo].[BookingStatus] ([id])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK_Table_BookingStatus]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Table_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK_Table_Users]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Table_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK_Table_Users1]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Table_Venues] FOREIGN KEY([VenueId])
REFERENCES [dbo].[Venues] ([Id])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK_Table_Venues]
GO

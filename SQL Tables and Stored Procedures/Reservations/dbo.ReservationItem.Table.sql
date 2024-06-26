
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TableId] [int] NOT NULL,
	[Start] [datetime2](7) NOT NULL,
	[End] [datetime2](7) NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_ReservationItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReservationItem] ADD  CONSTRAINT [DF_ReservationItem_DateAdded]  DEFAULT (getutcdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[ReservationItem] ADD  CONSTRAINT [DF_ReservationItem_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[ReservationItem]  WITH CHECK ADD  CONSTRAINT [FK_ReservationItem_Table] FOREIGN KEY([TableId])
REFERENCES [dbo].[Table] ([id])
GO
ALTER TABLE [dbo].[ReservationItem] CHECK CONSTRAINT [FK_ReservationItem_Table]
GO
ALTER TABLE [dbo].[ReservationItem]  WITH CHECK ADD  CONSTRAINT [FK_ReservationItem_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReservationItem] CHECK CONSTRAINT [FK_ReservationItem_Users]
GO
ALTER TABLE [dbo].[ReservationItem]  WITH CHECK ADD  CONSTRAINT [FK_ReservationItem_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReservationItem] CHECK CONSTRAINT [FK_ReservationItem_Users1]
GO
ALTER TABLE [dbo].[ReservationItem]  WITH CHECK ADD  CONSTRAINT [FK_ReservationItem_Users2] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReservationItem] CHECK CONSTRAINT [FK_ReservationItem_Users2]
GO

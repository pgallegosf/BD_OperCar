USE [OpeCar]
GO
/****** Object:  Table [dbo].[Mantenimiento]    Script Date: 19/12/2019 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mantenimiento](
	[MantenimientoId] [int] IDENTITY(1,1) NOT NULL,
	[MantenimientoLogo] [varchar](500) NOT NULL,
	[MantenimientoTelefono] [varchar](500) NULL,
	[MantenimientoMenuFooter] [varchar](500) NOT NULL,
	[MantenimientoSobreNosotros] [varchar](500) NOT NULL,
	[MantenimientoDerechosReservados] [varchar](100) NOT NULL,
	[MantenimientoFechaActualizacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Mantenimiento] PRIMARY KEY CLUSTERED 
(
	[MantenimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuFooter]    Script Date: 19/12/2019 16:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuFooter](
	[MenuFooterId] [int] IDENTITY(1,1) NOT NULL,
	[MantenimientoId] [int] NOT NULL,
	[MenuFooterName] [varchar](50) NOT NULL,
	[MenuFooterUrl] [varchar](100) NOT NULL,
	[MenuFooterPosition] [int] NOT NULL,
	[MenuFooterIsSuperAdmin] [bit] NOT NULL,
	[MenuFooterStatus] [bit] NOT NULL,
 CONSTRAINT [PK_MenuFooter] PRIMARY KEY CLUSTERED 
(
	[MenuFooterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mantenimiento] ON 

INSERT [dbo].[Mantenimiento] ([MantenimientoId], [MantenimientoLogo], [MantenimientoTelefono], [MantenimientoMenuFooter], [MantenimientoSobreNosotros], [MantenimientoDerechosReservados], [MantenimientoFechaActualizacion]) VALUES (1, N'/Content/images/logo.png', N'CAE: 987947810/ 999216057 / 043-604014 Anexo 130014.', N'Conoce tu organización', N'Somos un Grupo de promoción y operación de Infraestructura Smart con visión de futuro. Incorporamos el desarrollo tecnológico, la inteligencia empresarial e iniciativas socialmente responsables y respetuosas con el entorno ambiental para aportar soluciones de infraestructura y movilidad eficientes y sostenibles. ', N'Opecar - Derechos Reservados', CAST(N'2019-12-19T15:17:34.103' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mantenimiento] OFF
SET IDENTITY_INSERT [dbo].[MenuFooter] ON 

INSERT [dbo].[MenuFooter] ([MenuFooterId], [MantenimientoId], [MenuFooterName], [MenuFooterUrl], [MenuFooterPosition], [MenuFooterIsSuperAdmin], [MenuFooterStatus]) VALUES (1, 1, N'Conoce tu organización', N'/Organizacion', 1, 0, 1)
INSERT [dbo].[MenuFooter] ([MenuFooterId], [MantenimientoId], [MenuFooterName], [MenuFooterUrl], [MenuFooterPosition], [MenuFooterIsSuperAdmin], [MenuFooterStatus]) VALUES (2, 1, N'Aplicaciones', N'/Aplicacion', 2, 0, 1)
INSERT [dbo].[MenuFooter] ([MenuFooterId], [MantenimientoId], [MenuFooterName], [MenuFooterUrl], [MenuFooterPosition], [MenuFooterIsSuperAdmin], [MenuFooterStatus]) VALUES (3, 1, N'SIG', N'/SIG', 3, 0, 1)
INSERT [dbo].[MenuFooter] ([MenuFooterId], [MantenimientoId], [MenuFooterName], [MenuFooterUrl], [MenuFooterPosition], [MenuFooterIsSuperAdmin], [MenuFooterStatus]) VALUES (4, 1, N'Gestión Documentaria', N'/GDocumentaria', 4, 0, 1)
INSERT [dbo].[MenuFooter] ([MenuFooterId], [MantenimientoId], [MenuFooterName], [MenuFooterUrl], [MenuFooterPosition], [MenuFooterIsSuperAdmin], [MenuFooterStatus]) VALUES (5, 1, N'Seguridad', N'/Seguridad', 5, 0, 1)
SET IDENTITY_INSERT [dbo].[MenuFooter] OFF
ALTER TABLE [dbo].[MenuFooter]  WITH CHECK ADD  CONSTRAINT [FK_MenuFooter_Mantenimiento] FOREIGN KEY([MantenimientoId])
REFERENCES [dbo].[Mantenimiento] ([MantenimientoId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuFooter] CHECK CONSTRAINT [FK_MenuFooter_Mantenimiento]
GO

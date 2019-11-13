USE [OpeCar]
GO
/****** Object:  Schema [auditoria]    Script Date: 11/11/2019 22:18:56 ******/
CREATE SCHEMA [auditoria]
GO
/****** Object:  Schema [gDocumental]    Script Date: 11/11/2019 22:18:56 ******/
CREATE SCHEMA [gDocumental]
GO
/****** Object:  Schema [generalidades]    Script Date: 11/11/2019 22:18:56 ******/
CREATE SCHEMA [generalidades]
GO
/****** Object:  Schema [seguridad]    Script Date: 11/11/2019 22:18:56 ******/
CREATE SCHEMA [seguridad]
GO
/****** Object:  Table [auditoria].[Acceso]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[Acceso](
	[IdUsuario] [bigint] NOT NULL,
	[IdAcceso] [bigint] NOT NULL,
	[HostAdress] [nvarchar](20) NULL,
	[HostName] [nvarchar](20) NULL,
	[Agente] [nvarchar](100) NULL,
	[Token] [nvarchar](500) NOT NULL,
	[TokenHabilitado] [bit] NOT NULL,
	[TokenFechaExp] [datetime] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[NombreUsuario] [nvarchar](50) NULL,
 CONSTRAINT [PK_UsuarioLog] PRIMARY KEY CLUSTERED 
(
	[IdAcceso] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [auditoria].[AccesoError]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [auditoria].[AccesoError](
	[Id] [char](26) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[HostAdress] [varchar](20) NULL,
	[HostName] [varchar](20) NULL,
	[Agente] [varchar](100) NULL,
	[Codigo] [varchar](10) NULL,
	[Descripcion] [text] NOT NULL,
	[Pila] [text] NULL,
	[Excepcion] [text] NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_AccesoError] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [auditoria].[Aplicacion]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [auditoria].[Aplicacion](
	[IdAplicacion] [int] NOT NULL,
	[Codigo] [char](6) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[HabilitarBitacoraResp] [bit] NOT NULL,
	[HabilitarBitacoraReq] [bit] NOT NULL,
	[HabilitarBitacoraEx] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [bigint] NOT NULL,
 CONSTRAINT [PK_Aplicacion] PRIMARY KEY CLUSTERED 
(
	[IdAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [auditoria].[Bitacora]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[Bitacora](
	[IdBitacora] [bigint] NULL,
	[IdUsuario] [bigint] NOT NULL,
	[IdAcceso] [bigint] NOT NULL,
	[IdAplicacion] [int] NOT NULL,
	[IdFuncion] [int] NULL,
	[IdTipoBitacora] [tinyint] NOT NULL,
	[Codigo] [nvarchar](10) NULL,
	[Descripcion] [text] NOT NULL,
	[Pila] [text] NULL,
	[FechaCreacion] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [auditoria].[Funcion]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[Funcion](
	[IdAplicacion] [int] NOT NULL,
	[IdFuncion] [int] NOT NULL,
	[Nombre] [nvarchar](40) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [bigint] NOT NULL,
 CONSTRAINT [PK_Funcion] PRIMARY KEY CLUSTERED 
(
	[IdFuncion] ASC,
	[IdAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [auditoria].[Parametro]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[Parametro](
	[IdParametro] [int] NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Valor] [nvarchar](512) NOT NULL,
	[IdUsuarioCreacion] [bigint] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[IdParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [auditoria].[TipoBitacora]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[TipoBitacora](
	[IdTipoBitacora] [tinyint] NOT NULL,
	[Nombre] [nvarchar](40) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [bigint] NOT NULL,
 CONSTRAINT [PK_TipoBitacora] PRIMARY KEY CLUSTERED 
(
	[IdTipoBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seccion]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seccion](
	[IdSeccion] [int] NOT NULL,
	[IdTipoSeccion] [smallint] NOT NULL,
	[Titulo] [varchar](200) NOT NULL,
	[Contenido] [text] NULL,
	[IdUsuarioCreacion] [bigint] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [bigint] NULL,
	[FechaModificacion] [datetime] NULL,
	[RutaMultimedia] [nvarchar](200) NULL,
	[Posicion] [int] NOT NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED 
(
	[IdSeccion] ASC,
	[IdTipoSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoSeccion]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoSeccion](
	[IdTipoSeccion] [smallint] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoSeccion] PRIMARY KEY CLUSTERED 
(
	[IdTipoSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [gDocumental].[Area]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[Area](
	[IdArea] [int] NOT NULL,
	[IdTipoArea] [int] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[AreaHist]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[AreaHist](
	[IdArea] [int] NOT NULL,
	[IdHistorial] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[UrlImg] [nvarchar](50) NOT NULL,
	[IdUsuarioModificacion] [bigint] NULL,
	[FechaModificacion] [datetime] NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_AreaHist] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC,
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[Documento]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[Documento](
	[IdDocumento] [int] NOT NULL,
	[IdSubArea] [int] NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[IdUsuarioCreacion] [bigint] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[IdDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[DocumentoHist]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[DocumentoHist](
	[IdDocumento] [int] NOT NULL,
	[IdHistorico] [int] NOT NULL,
	[NombreDocumento] [nvarchar](100) NOT NULL,
	[UrlDocumento] [nvarchar](150) NOT NULL,
	[IdUsuarioModificacion] [bigint] NULL,
	[FechaModificacion] [datetime] NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_DocumentoHist] PRIMARY KEY CLUSTERED 
(
	[IdDocumento] ASC,
	[IdHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[SubArea]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[SubArea](
	[IdSubArea] [int] NOT NULL,
	[IdArea] [int] NOT NULL,
	[IdPadre] [int] NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_SubArea] PRIMARY KEY CLUSTERED 
(
	[IdSubArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[SubAreaHist]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[SubAreaHist](
	[IdSubArea] [int] NOT NULL,
	[IdHistorial] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[EsUltimo] [bit] NOT NULL,
	[IdUsuarioModificacion] [bigint] NULL,
	[FechaModificacion] [datetime] NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_SubAreaHist] PRIMARY KEY CLUSTERED 
(
	[IdSubArea] ASC,
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[TipoArea]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[TipoArea](
	[IdTipoArea] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoArea] PRIMARY KEY CLUSTERED 
(
	[IdTipoArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[TipoDocumento]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[TipoDocumento](
	[IdTipoDocumento] [int] NOT NULL,
	[Descripción] [nvarchar](100) NOT NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [generalidades].[Enlace]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [generalidades].[Enlace](
	[IdEnlace] [int] NOT NULL,
	[Descripcion] [nvarchar](80) NOT NULL,
	[UrlEnlace] [nvarchar](100) NOT NULL,
	[ImgEnlace] [nvarchar](100) NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
	[IdUsuarioModificacion] [int] NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Enlace] PRIMARY KEY CLUSTERED 
(
	[IdEnlace] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [seguridad].[Parametro]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Parametro](
	[IdParametro] [int] NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Valor] [nvarchar](512) NOT NULL,
	[IdUsuarioCreacion] [bigint] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[IdParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [seguridad].[Permiso]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Permiso](
	[IdUsuario] [bigint] NOT NULL,
	[IdRol] [tinyint] NOT NULL,
	[IdArea] [int] NOT NULL,
	[IdHistorico] [int] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaIniVig] [datetime] NOT NULL,
	[FechaFinVig] [datetime] NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdRol] ASC,
	[IdArea] ASC,
	[IdHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [seguridad].[Rol]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Rol](
	[IdRol] [tinyint] NOT NULL,
	[Nombre] [nvarchar](40) NOT NULL,
	[Habilitado] [bit] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[IdUsuarioModificacion] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [seguridad].[Usuario]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Usuario](
	[IdUsuario] [bigint] NOT NULL,
	[Usuario] [nvarchar](50) NOT NULL,
	[NombreCompleto] [nvarchar](100) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [bigint] NOT NULL,
	[IndicadorSistema] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [seguridad].[UsuarioHist]    Script Date: 11/11/2019 22:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[UsuarioHist](
	[IdUsuario] [bigint] NOT NULL,
	[IdHistorico] [int] NOT NULL,
	[FechaIniVig] [datetime] NOT NULL,
	[FechaFinVig] [datetime] NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioHist] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [auditoria].[Acceso] ([IdUsuario], [IdAcceso], [HostAdress], [HostName], [Agente], [Token], [TokenHabilitado], [TokenFechaExp], [FechaCreacion], [NombreUsuario]) VALUES (1, 1, N'aa', N'aa', N'ss', N'dsd', 1, CAST(N'2019-06-18 23:44:00.077' AS DateTime), CAST(N'2019-06-18 23:44:00.077' AS DateTime), N'pgallegos')
INSERT [auditoria].[Acceso] ([IdUsuario], [IdAcceso], [HostAdress], [HostName], [Agente], [Token], [TokenHabilitado], [TokenFechaExp], [FechaCreacion], [NombreUsuario]) VALUES (1, 2, N'aa', N'aa', N'ss', N'dsd', 1, CAST(N'2019-05-18 00:00:00.000' AS DateTime), CAST(N'2019-05-18 23:44:00.120' AS DateTime), N'pgallegos')
INSERT [auditoria].[Acceso] ([IdUsuario], [IdAcceso], [HostAdress], [HostName], [Agente], [Token], [TokenHabilitado], [TokenFechaExp], [FechaCreacion], [NombreUsuario]) VALUES (1, 3, N'aa', N'aa', N'ss', N'dsd', 1, CAST(N'2019-05-18 00:00:00.000' AS DateTime), CAST(N'2019-05-18 23:44:00.123' AS DateTime), N'pgallegos')
INSERT [auditoria].[Acceso] ([IdUsuario], [IdAcceso], [HostAdress], [HostName], [Agente], [Token], [TokenHabilitado], [TokenFechaExp], [FechaCreacion], [NombreUsuario]) VALUES (1, 4, N'aa', N'aa', N'ss', N'dsd', 1, CAST(N'2019-04-18 00:00:00.000' AS DateTime), CAST(N'2019-04-18 23:44:00.127' AS DateTime), N'pgallegos')
INSERT [dbo].[Seccion] ([IdSeccion], [IdTipoSeccion], [Titulo], [Contenido], [IdUsuarioCreacion], [FechaCreacion], [IdUsuarioModificacion], [FechaModificacion], [RutaMultimedia], [Posicion], [IndicadorHabilitado]) VALUES (1, 1, N'Misión', N'Brindar servicios de Operación y Conservación de Infraestructura Vial, que excedan las expectativas de nuestros clientes y grupos de interés, con las mejores prácticas de gestión y excelencia, contribuyendo al desarrollo sostenible de las comunidades en que operamos.', 1, CAST(N'2019-06-09 17:49:58.717' AS DateTime), 1, CAST(N'2019-06-10 23:38:21.643' AS DateTime), N'', 1, 1)
INSERT [dbo].[Seccion] ([IdSeccion], [IdTipoSeccion], [Titulo], [Contenido], [IdUsuarioCreacion], [FechaCreacion], [IdUsuarioModificacion], [FechaModificacion], [RutaMultimedia], [Posicion], [IndicadorHabilitado]) VALUES (2, 1, N'Visión', N'A finales del 2020, convertirnos en la empresa especializada en servicios de Operación y Conservación de la Infraestructura Vial, reconocido por superar las expectativas de los clientes y por contribuir al desarrollo sostenible de nuestro planeta.', 1, CAST(N'2019-06-09 17:56:49.417' AS DateTime), 1, CAST(N'2019-06-09 18:00:17.100' AS DateTime), N'', 2, 0)
INSERT [dbo].[Seccion] ([IdSeccion], [IdTipoSeccion], [Titulo], [Contenido], [IdUsuarioCreacion], [FechaCreacion], [IdUsuarioModificacion], [FechaModificacion], [RutaMultimedia], [Posicion], [IndicadorHabilitado]) VALUES (3, 1, N'Visión', N'dsdsdsdddssdfdsfgdgdgfgfdg
gfdgfdgfdgfdgfdgsdsdaaaaaaaaa
gdfgfdgfdgfd
gfdgfdgfdg
gfdgfdgfd
gfdgfd', 1, CAST(N'2019-06-10 23:43:21.877' AS DateTime), 1, CAST(N'2019-06-10 23:43:51.717' AS DateTime), N'/Content/images/45737613_4178416325520361_6717425126930907136_n.jpg', 2, 1)
INSERT [dbo].[TipoSeccion] ([IdTipoSeccion], [Descripcion]) VALUES (1, N'Generalidades')
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (1, 1, 1, CAST(N'2019-03-23 23:57:23.340' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (2, 1, 1, CAST(N'2019-03-23 23:57:23.363' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (3, 1, 1, CAST(N'2019-03-23 23:57:23.370' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (4, 1, 1, CAST(N'2019-03-23 23:57:23.373' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (5, 1, 1, CAST(N'2019-03-23 23:57:23.377' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (6, 1, 1, CAST(N'2019-03-23 23:57:23.380' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (7, 1, 1, CAST(N'2019-03-23 23:57:23.380' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (8, 1, 1, CAST(N'2019-03-23 23:57:23.387' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (11, 2, 1, CAST(N'2019-04-24 21:49:39.657' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (12, 2, 1, CAST(N'2019-04-24 21:49:39.687' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (13, 2, 1, CAST(N'2019-04-24 21:49:39.690' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (14, 2, 1, CAST(N'2019-04-24 21:49:39.690' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (15, 2, 1, CAST(N'2019-04-24 21:49:39.690' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (16, 2, 1, CAST(N'2019-04-24 21:49:39.693' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (17, 2, 1, CAST(N'2019-04-24 21:49:39.693' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (18, 2, 1, CAST(N'2019-04-24 21:49:39.697' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (19, 2, 1, CAST(N'2019-04-24 21:49:39.697' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (20, 2, 1, CAST(N'2019-04-24 21:49:39.700' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (21, 2, 1, CAST(N'2019-04-24 21:49:39.700' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (22, 1, 1, CAST(N'2019-05-05 11:10:38.577' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (23, 2, 1, CAST(N'2019-05-06 23:29:58.577' AS DateTime))
INSERT [gDocumental].[Area] ([IdArea], [IdTipoArea], [IdUsuarioCreacion], [FechaCreacion]) VALUES (24, 1, 1, CAST(N'2019-05-15 21:20:54.970' AS DateTime))
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 1, N'Recaudación', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-09 00:00:00.000' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 2, N'Recaudaciónnnnn', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:03:59.197' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 3, N'Recaudación', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:04:22.567' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 4, N'Recaudaciónes', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:04:30.353' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 5, N'Recaudación', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:04:30.353' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 1, N'Conservación Vial', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:52:45.557' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 2, N'Conservación Viale', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:52:54.427' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 3, N'Conservación Vial', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:53:01.620' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 4, N'Conservación Viales', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:53:11.813' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 5, N'Conservación Vial', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:53:15.507' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 6, N'Conservación Viales', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:53:15.507' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 1, N'Atención al Usuario', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:50:07.910' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 2, N'Atención al Usuarios', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:52:21.040' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 3, N'Atención al Usuari', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 12:52:38.370' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 4, N'Atención al Usuario', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:03:29.710' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 5, N'Atención al Usuarios', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:03:34.080' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 6, N'Atención al Usuarioses', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:03:39.770' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 7, N'Atención al Usuarios', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:03:39.770' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 1, N'Sistemas e Infraestructura de TI', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-05-04 18:40:21.437' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 2, N'Sistema e Infraestructura de TI', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-05-04 18:40:33.720' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 3, N'Sistemas e Infraestructura de TI', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-05-04 18:40:33.720' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (5, 1, N'Recursos Humanos', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:04:09.693' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (5, 2, N'Recursos Humanoss', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:04:18.523' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (5, 3, N'Recursos Humanos', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:04:18.523' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (6, 1, N'Logística y Almacén', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:11:54.597' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (6, 2, N'Logística y Almacén', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-28 13:11:54.597' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (7, 1, N'Seguridad y Salud en el Trabajo', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-03-26 00:17:36.737' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (8, 1, N'Gestión Ambiental y Asuntos Sociales', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-03-26 00:17:36.740' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (11, 1, N'Atención al Usuario', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.703' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (12, 1, N'Conservación Vial', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.703' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (13, 1, N'Estadística y Control de Gestión', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.707' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (14, 1, N'Gestión Ambiental y Asuntos Sociales', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.707' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (15, 1, N'Logística y Almacén', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.707' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (16, 1, N'Prevención de Riesgos, GA, RSE', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.710' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (17, 1, N'Recaudación', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.717' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (18, 1, N'Recursos Humanos', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.717' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (19, 1, N'Seguridad y Salud en el trabajo', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.720' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (20, 1, N'Sistema Integrado de Gestión', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.720' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (21, 1, N'Sistemas e Infraestructura de TI', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-04-24 21:49:39.720' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (22, 1, N'formatos', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-05-05 11:11:04.437' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (22, 2, N'Formatos', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-06-06 22:10:00.763' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (23, 1, N'area Prueba GD', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-05-06 23:30:29.120' AS DateTime), 0)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (23, 2, N'Area Prueba GD', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-05-06 23:30:29.120' AS DateTime), 1)
INSERT [gDocumental].[AreaHist] ([IdArea], [IdHistorial], [Descripcion], [UrlImg], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (24, 1, N'Sistemassss', N'Content/images/iconos_ALEATICA-40.png', 1, CAST(N'2019-05-15 21:20:54.970' AS DateTime), 1)
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (1, 1, 1, 1, CAST(N'2019-03-26 00:18:26.413' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (2, 2, 1, 1, CAST(N'2019-03-26 00:19:47.763' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (3, 1, 1, 1, CAST(N'2019-03-26 00:30:10.373' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (4, 4, 1, 1, CAST(N'2019-03-26 00:56:03.010' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (5, 4, 1, 1, CAST(N'2019-03-26 01:22:38.020' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (6, 4, 1, 1, CAST(N'2019-03-26 23:15:50.987' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (7, 4, 1, 1, CAST(N'2019-03-27 13:35:00.563' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (8, 4, 1, 1, CAST(N'2019-03-27 13:42:23.190' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (9, 4, 1, 1, CAST(N'2019-04-03 21:09:49.973' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (10, 4, 1, 1, CAST(N'2019-04-03 21:33:00.630' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (11, 4, 4, 1, CAST(N'2019-04-03 22:24:19.083' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (12, 4, 4, 1, CAST(N'2019-04-03 22:26:18.087' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (13, 7, 4, 1, CAST(N'2019-04-24 22:52:04.873' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (14, 7, 5, 1, CAST(N'2019-04-24 22:52:31.267' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (15, 7, 1, 1, CAST(N'2019-04-24 23:00:34.577' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (16, 7, 1, 1, CAST(N'2019-04-24 23:00:48.460' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (17, 2, 2, 1, CAST(N'2019-05-05 11:18:27.527' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (18, 8, 2, 1, CAST(N'2019-05-15 21:27:09.627' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (19, 9, 1, 1, CAST(N'2019-05-15 21:28:17.550' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (20, 11, 1, 1, CAST(N'2019-05-15 21:29:44.237' AS DateTime))
INSERT [gDocumental].[Documento] ([IdDocumento], [IdSubArea], [IdTipoDocumento], [IdUsuarioCreacion], [FechaCreacion]) VALUES (21, 19, 1, 1, CAST(N'2019-05-16 00:28:39.890' AS DateTime))
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 1, N'anita flores. lima - iquitos (1).pdf', N'~/Content/file/SIG/ 1\anita flores. lima - iquitos (1).pdf', 1, CAST(N'2019-03-26 00:18:26.413' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 1, N'curriculum-cruzhuingo-p.pdf', N'~/Content/file/SIG/ 2\curriculum-cruzhuingo-p.pdf', 1, CAST(N'2019-03-26 00:19:47.763' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 1, N'0005246010013537131.pdf', N'~/Content/file/SIG/ 1\0005246010013537131.pdf', 1, CAST(N'2019-03-26 00:30:10.373' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 1, N'0005246010013537131.pdf', N'~/Content/file/SIG/ 4\0005246010013537131.pdf', 1, CAST(N'2019-03-26 00:56:03.010' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (5, 1, N'anita flores. lima - iquitos.pdf', N'~/Content/file/SIG/ 4\anita flores. lima - iquitos.pdf', 1, CAST(N'2019-03-26 01:22:38.020' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (6, 1, N'BajarBoletaElectronica.pdf', N'~/Content/file/SIG/ 4\BajarBoletaElectronica.pdf', 1, CAST(N'2019-03-26 23:15:50.987' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (7, 1, N'Anita Flores. Lima - Iquitos.pdf', N'~/Content/file/SIG/ 4\Anita Flores. Lima - Iquitos.pdf', 1, CAST(N'2019-03-27 13:35:00.563' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (8, 1, N'RHE10473039732E0018.pdf', N'~/Content/file/SIG/ 4\RHE10473039732E0018.pdf', 1, CAST(N'2019-03-27 13:42:23.190' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (9, 1, N'0005246010013537131.pdf', N'~/Content/file/SIG/ 4\0005246010013537131.pdf', 1, CAST(N'2019-04-03 21:09:49.973' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (10, 1, N'ArquitecturaProyecto (Copia de trabajo).pptx', N'~/Content/file/SIG/ 4\ArquitecturaProyecto (Copia de trabajo).pptx', 1, CAST(N'2019-04-03 21:33:00.630' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (11, 1, N'FenixSuscriptorCapacitacion.pptx', N'~/Content/file/SIG/ 4\FenixSuscriptorCapacitacion.pptx', 1, CAST(N'2019-04-03 22:24:19.083' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (12, 1, N'FenixSuscriptorCapacitacion22.pptx', N'~/Content/file/SIG/ 4\FenixSuscriptorCapacitacion22.pptx', 1, CAST(N'2019-04-03 22:26:18.087' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (13, 1, N'FenixSuscriptorCapacitacion.pptx', N'~/Content/file/SIG/ 7\FenixSuscriptorCapacitacion.pptx', 1, CAST(N'2019-04-24 22:52:04.873' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (14, 1, N'CAE_OSITRAN.accdb', N'~/Content/file/SIG/ 7\CAE_OSITRAN.accdb', 1, CAST(N'2019-04-24 22:52:31.267' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (15, 1, N'GALLEGOSFLORES_POOL-CV (1).pdf', N'~/Content/file/SIG/ 7\GALLEGOSFLORES_POOL-CV (1).pdf', 1, CAST(N'2019-04-24 23:00:34.577' AS DateTime), 0)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (16, 1, N'Curriculum-CruzHuingo-P.pdf', N'~/Content/file/SIG/ 7\Curriculum-CruzHuingo-P.pdf', 1, CAST(N'2019-04-24 23:00:48.460' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (17, 1, N'TESIS-CASTILLO-GALLEGOS-M.docx', N'~/Content/file/SIG/2\TESIS-CASTILLO-GALLEGOS-M.docx', 1, CAST(N'2019-05-05 11:18:27.527' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (18, 1, N'TESIS-CASTILLO-GALLEGOS-M.docx', N'~/Content/file/SIG/8\TESIS-CASTILLO-GALLEGOS-M.docx', 1, CAST(N'2019-05-15 21:27:09.627' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (19, 1, N'04 OC-SIG-P-004 Comunicación.pdf', N'~/Content/file/SIG/9\04 OC-SIG-P-004 Comunicación.pdf', 1, CAST(N'2019-05-15 21:28:17.550' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (20, 1, N'04 OC-SIG-P-004 Comunicación.pdf', N'~/Content/file/SIG/11\04 OC-SIG-P-004 Comunicación.pdf', 1, CAST(N'2019-05-15 21:29:44.237' AS DateTime), 1)
INSERT [gDocumental].[DocumentoHist] ([IdDocumento], [IdHistorico], [NombreDocumento], [UrlDocumento], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (21, 1, N'Informe-2019-ASI-017 Servicio de Mantenimiento de Equipos en Vía Febrero.pdf', N'~/Content/file/SIG/19\Informe-2019-ASI-017 Servicio de Mantenimiento de Equipos en Vía Febrero.pdf', 1, CAST(N'2019-05-16 00:28:39.890' AS DateTime), 1)
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (1, 4, NULL, 1, CAST(N'2019-03-26 00:18:06.430' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (2, 4, 1, 1, CAST(N'2019-03-26 00:19:14.490' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (3, 4, 1, 1, CAST(N'2019-03-26 00:20:12.057' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (4, 4, NULL, 1, CAST(N'2019-03-26 00:36:04.223' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (5, 3, NULL, 1, CAST(N'2019-04-24 22:21:40.487' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (6, 11, NULL, 1, CAST(N'2019-04-24 22:37:49.373' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (7, 11, NULL, 1, CAST(N'2019-04-24 22:43:07.743' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (8, 4, NULL, 1, CAST(N'2019-05-15 21:26:34.110' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (9, 4, 8, 1, CAST(N'2019-05-15 21:27:48.113' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (10, 19, NULL, 1, CAST(N'2019-05-15 21:29:14.277' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (11, 19, 10, 1, CAST(N'2019-05-15 21:29:27.957' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (12, 4, 4, 1, CAST(N'2019-05-15 23:34:22.617' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (13, 4, NULL, 1, CAST(N'2019-05-16 00:01:55.727' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (14, 4, 13, 1, CAST(N'2019-05-16 00:02:07.580' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (15, 4, 13, 1, CAST(N'2019-05-16 00:04:18.367' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (16, 21, NULL, 1, CAST(N'2019-05-16 00:07:51.513' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (17, 21, 16, 1, CAST(N'2019-05-16 00:24:35.373' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (18, 21, NULL, 1, CAST(N'2019-05-16 00:25:08.853' AS DateTime))
INSERT [gDocumental].[SubArea] ([IdSubArea], [IdArea], [IdPadre], [IdUsuarioCreacion], [FechaCreacion]) VALUES (19, 21, 16, 1, CAST(N'2019-05-16 00:28:15.257' AS DateTime))
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 1, N'Formatos', 0, 1, CAST(N'2019-04-09 00:00:00.000' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 2, N'Formatoss', 0, 1, CAST(N'2019-05-15 23:00:36.517' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (1, 3, N'Formatos', 0, 1, CAST(N'2019-05-16 00:00:15.503' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 1, N'2018', 1, 1, CAST(N'2019-05-15 23:59:37.620' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 2, N'20188', 1, 1, CAST(N'2019-05-16 00:00:01.960' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (2, 3, N'2018', 1, 1, CAST(N'2019-05-16 00:00:01.960' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (3, 1, N'2017', 1, 1, CAST(N'2019-03-26 00:20:12.057' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 1, N'Adicionales', 0, 1, CAST(N'2019-05-15 22:52:12.670' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 2, N'Adicionalesss', 0, 1, CAST(N'2019-05-15 22:55:12.300' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 3, N'Adicionales', 0, 1, CAST(N'2019-05-15 22:57:44.083' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 4, N'Adicional', 0, 1, CAST(N'2019-05-15 22:57:56.667' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (4, 5, N'Adicionales', 0, 1, CAST(N'2019-05-16 00:00:33.757' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (5, 1, N'Formatos', 0, 1, CAST(N'2019-04-24 22:21:40.487' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (6, 1, N'Informes', 0, 1, CAST(N'2019-04-24 22:37:49.373' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (7, 1, N'Documentos', 0, 1, CAST(N'2019-04-24 22:43:07.743' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (8, 1, N'Formsto prueba', 0, 1, CAST(N'2019-05-15 23:20:03.103' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (9, 1, N'formato 1', 1, 1, CAST(N'2019-05-15 21:27:48.113' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (10, 1, N'formatos', 0, 1, CAST(N'2019-05-15 21:29:14.277' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (11, 1, N'2018', 1, 1, CAST(N'2019-05-15 21:29:27.957' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (12, 1, N'2018', 1, 1, CAST(N'2019-05-15 23:34:22.617' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (13, 1, N'formatos', 0, 1, CAST(N'2019-05-16 00:37:51.910' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (13, 2, N'formatoss', 0, 1, CAST(N'2019-05-16 00:38:20.407' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (13, 3, N'formatos', 0, 1, CAST(N'2019-05-16 00:38:27.583' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (13, 4, N'formatos', 0, 1, CAST(N'2019-05-16 00:40:39.530' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (13, 5, N'formatoss', 0, 1, CAST(N'2019-05-16 00:40:39.530' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (14, 1, N'2018', 1, 1, CAST(N'2019-05-16 00:02:16.270' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (15, 1, N'2018', 1, 1, CAST(N'2019-05-16 00:07:19.337' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (15, 2, N'2019', 1, 1, CAST(N'2019-05-16 00:07:19.337' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (16, 1, N'Formatos', 0, 1, CAST(N'2019-05-16 00:24:25.980' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (16, 2, N'Formatoss', 0, 1, CAST(N'2019-05-16 00:24:56.263' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (16, 3, N'Formatos', 0, 1, CAST(N'2019-05-16 00:28:07.277' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (16, 4, N'Formatos', 0, 1, CAST(N'2019-05-16 00:28:07.277' AS DateTime), 1)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (17, 1, N'2018', 1, 1, CAST(N'2019-05-16 00:24:47.120' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (18, 1, N'Procedimientos', 0, 1, CAST(N'2019-05-16 00:25:16.670' AS DateTime), 0)
INSERT [gDocumental].[SubAreaHist] ([IdSubArea], [IdHistorial], [Descripcion], [EsUltimo], [IdUsuarioModificacion], [FechaModificacion], [IndicadorHabilitado]) VALUES (19, 1, N'2018', 1, 1, CAST(N'2019-05-16 00:28:15.257' AS DateTime), 1)
INSERT [gDocumental].[TipoArea] ([IdTipoArea], [Descripcion]) VALUES (1, N'SIG')
INSERT [gDocumental].[TipoArea] ([IdTipoArea], [Descripcion]) VALUES (2, N'GESTIÓN DOCUMENTARIA')
INSERT [gDocumental].[TipoDocumento] ([IdTipoDocumento], [Descripción], [IndicadorHabilitado]) VALUES (1, N'pdf', 1)
INSERT [gDocumental].[TipoDocumento] ([IdTipoDocumento], [Descripción], [IndicadorHabilitado]) VALUES (2, N'Word', 1)
INSERT [gDocumental].[TipoDocumento] ([IdTipoDocumento], [Descripción], [IndicadorHabilitado]) VALUES (3, N'Excel', 1)
INSERT [gDocumental].[TipoDocumento] ([IdTipoDocumento], [Descripción], [IndicadorHabilitado]) VALUES (4, N'power point', 1)
INSERT [gDocumental].[TipoDocumento] ([IdTipoDocumento], [Descripción], [IndicadorHabilitado]) VALUES (5, N'Otro', 1)
INSERT [generalidades].[Enlace] ([IdEnlace], [Descripcion], [UrlEnlace], [ImgEnlace], [IdUsuarioCreacion], [FechaCreacion], [IndicadorHabilitado], [IdUsuarioModificacion], [FechaModificacion]) VALUES (1, N'Office 365', N'https://www.office.com', N'/Content/images/iconos_ALEATICA-53.png', 1, CAST(N'2019-06-09 17:36:32.987' AS DateTime), 1, NULL, NULL)
INSERT [generalidades].[Enlace] ([IdEnlace], [Descripcion], [UrlEnlace], [ImgEnlace], [IdUsuarioCreacion], [FechaCreacion], [IndicadorHabilitado], [IdUsuarioModificacion], [FechaModificacion]) VALUES (2, N'Citrix', N'https://app.ohlconcesiones.com.pe/Citrix/XenApp/auth/login.aspx', N'/Content/images/853e49fe-1353-4af2-bdab-a6bb7cf22241.jpg', 1, CAST(N'2019-06-09 22:48:26.647' AS DateTime), 1, 1, CAST(N'2019-06-10 00:20:28.610' AS DateTime))
INSERT [generalidades].[Enlace] ([IdEnlace], [Descripcion], [UrlEnlace], [ImgEnlace], [IdUsuarioCreacion], [FechaCreacion], [IndicadorHabilitado], [IdUsuarioModificacion], [FechaModificacion]) VALUES (3, N'Intranet', N'https://app.ohlconcesiones.com.pe/Citrix/XenApp/auth/login.aspx', N'/Content/images/iconos_ALEATICA-33.png', 1, CAST(N'2019-06-09 23:07:22.667' AS DateTime), 1, NULL, NULL)
INSERT [generalidades].[Enlace] ([IdEnlace], [Descripcion], [UrlEnlace], [ImgEnlace], [IdUsuarioCreacion], [FechaCreacion], [IndicadorHabilitado], [IdUsuarioModificacion], [FechaModificacion]) VALUES (4, N'Intranet local', N'https://app.ohlconcesiones.com.pe/Citrix/XenApp/auth/login.aspx', N'/Content/images/iconos_ALEATICA-33.png', 1, CAST(N'2019-06-09 23:39:53.173' AS DateTime), 0, 1, CAST(N'2019-06-10 00:29:23.033' AS DateTime))
INSERT [generalidades].[Enlace] ([IdEnlace], [Descripcion], [UrlEnlace], [ImgEnlace], [IdUsuarioCreacion], [FechaCreacion], [IndicadorHabilitado], [IdUsuarioModificacion], [FechaModificacion]) VALUES (5, N'Intranet ccddddd', N'https://app.ohlconcesiones.com.pe/Citrix/XenApp/auth/login.aspx', N'', 1, CAST(N'2019-06-10 00:12:57.933' AS DateTime), 0, 1, CAST(N'2019-06-10 00:18:58.390' AS DateTime))
INSERT [generalidades].[Enlace] ([IdEnlace], [Descripcion], [UrlEnlace], [ImgEnlace], [IdUsuarioCreacion], [FechaCreacion], [IndicadorHabilitado], [IdUsuarioModificacion], [FechaModificacion]) VALUES (6, N'Intranet ccddddd', N'https://app.ohlconcesiones.com.pe/Citrix/XenApp/auth/login.aspx', N'/Content/images/0afd6b24-d976-42d8-80f0-6fe6aaaeffd0.jpg', 1, CAST(N'2019-06-10 00:14:15.000' AS DateTime), 0, 1, CAST(N'2019-06-10 00:19:12.947' AS DateTime))
INSERT [seguridad].[Parametro] ([IdParametro], [Descripcion], [Valor], [IdUsuarioCreacion], [FechaCreacion], [Estado]) VALUES (1, N'Clave de seguridad para el token', N'asdsadfiygasdfasdfaseñkjaskhbasdflkiyasdyguasdkñjasdf', 1, CAST(N'2019-03-24 00:58:11.567' AS DateTime), 1)
INSERT [seguridad].[Parametro] ([IdParametro], [Descripcion], [Valor], [IdUsuarioCreacion], [FechaCreacion], [Estado]) VALUES (2, N'Duración del toquen (minutos)', N'30', 1, CAST(N'2019-03-24 00:58:24.720' AS DateTime), 1)
INSERT [seguridad].[Permiso] ([IdUsuario], [IdRol], [IdArea], [IdHistorico], [IdUsuarioCreacion], [FechaCreacion], [FechaIniVig], [FechaFinVig]) VALUES (3, 1, 1, 1, 1, CAST(N'2019-05-27 00:00:00.000' AS DateTime), CAST(N'2019-05-27 00:00:00.000' AS DateTime), NULL)
INSERT [seguridad].[Permiso] ([IdUsuario], [IdRol], [IdArea], [IdHistorico], [IdUsuarioCreacion], [FechaCreacion], [FechaIniVig], [FechaFinVig]) VALUES (3, 2, 1, 1, 1, CAST(N'2019-05-27 01:05:39.417' AS DateTime), CAST(N'2019-05-27 01:05:39.417' AS DateTime), CAST(N'2019-05-27 01:07:29.037' AS DateTime))
INSERT [seguridad].[Permiso] ([IdUsuario], [IdRol], [IdArea], [IdHistorico], [IdUsuarioCreacion], [FechaCreacion], [FechaIniVig], [FechaFinVig]) VALUES (3, 2, 1, 2, 1, CAST(N'2019-05-27 01:07:52.577' AS DateTime), CAST(N'2019-05-27 01:07:52.577' AS DateTime), NULL)
INSERT [seguridad].[Permiso] ([IdUsuario], [IdRol], [IdArea], [IdHistorico], [IdUsuarioCreacion], [FechaCreacion], [FechaIniVig], [FechaFinVig]) VALUES (4, 1, 1, 1, 1, CAST(N'2019-05-27 00:00:00.000' AS DateTime), CAST(N'2019-05-27 00:00:00.000' AS DateTime), NULL)
INSERT [seguridad].[Permiso] ([IdUsuario], [IdRol], [IdArea], [IdHistorico], [IdUsuarioCreacion], [FechaCreacion], [FechaIniVig], [FechaFinVig]) VALUES (5, 1, 1, 1, 1, CAST(N'2019-05-27 00:00:00.000' AS DateTime), CAST(N'2019-05-27 00:00:00.000' AS DateTime), NULL)
INSERT [seguridad].[Rol] ([IdRol], [Nombre], [Habilitado], [IdUsuarioCreacion], [IdUsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (1, N'Colaborador', 1, 1, NULL, CAST(N'2019-05-26 23:17:08.357' AS DateTime), NULL)
INSERT [seguridad].[Rol] ([IdRol], [Nombre], [Habilitado], [IdUsuarioCreacion], [IdUsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (2, N'Administrador', 1, 1, NULL, CAST(N'2019-05-26 23:17:08.380' AS DateTime), NULL)
INSERT [seguridad].[Rol] ([IdRol], [Nombre], [Habilitado], [IdUsuarioCreacion], [IdUsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (3, N'SuperAdmin', 1, 1, NULL, CAST(N'2019-05-26 23:17:08.387' AS DateTime), NULL)
INSERT [seguridad].[Usuario] ([IdUsuario], [Usuario], [NombreCompleto], [FechaCreacion], [IdUsuarioCreacion], [IndicadorSistema]) VALUES (1, N'admin', N'ADMINISTRADOR', CAST(N'2019-03-23 23:53:07.777' AS DateTime), 1, NULL)
INSERT [seguridad].[Usuario] ([IdUsuario], [Usuario], [NombreCompleto], [FechaCreacion], [IdUsuarioCreacion], [IndicadorSistema]) VALUES (2, N'olga.cruz@operadora.pe', N'Olga Cruz Huingo', CAST(N'2019-03-24 00:40:40.110' AS DateTime), 1, NULL)
INSERT [seguridad].[Usuario] ([IdUsuario], [Usuario], [NombreCompleto], [FechaCreacion], [IdUsuarioCreacion], [IndicadorSistema]) VALUES (3, N'pool2', N'Pool gallegos', CAST(N'2019-05-27 00:49:35.567' AS DateTime), 1, NULL)
INSERT [seguridad].[Usuario] ([IdUsuario], [Usuario], [NombreCompleto], [FechaCreacion], [IdUsuarioCreacion], [IndicadorSistema]) VALUES (4, N'ocruz', N'Olga Cruz Huingo', CAST(N'2019-05-27 00:53:33.627' AS DateTime), 1, NULL)
INSERT [seguridad].[Usuario] ([IdUsuario], [Usuario], [NombreCompleto], [FechaCreacion], [IdUsuarioCreacion], [IndicadorSistema]) VALUES (5, N'fvigo', N'fernando vigo', CAST(N'2019-05-27 01:09:02.130' AS DateTime), 1, NULL)
INSERT [seguridad].[UsuarioHist] ([IdUsuario], [IdHistorico], [FechaIniVig], [FechaFinVig], [Habilitado]) VALUES (1, 1, CAST(N'2019-03-24 00:37:26.533' AS DateTime), NULL, 1)
INSERT [seguridad].[UsuarioHist] ([IdUsuario], [IdHistorico], [FechaIniVig], [FechaFinVig], [Habilitado]) VALUES (2, 1, CAST(N'2019-03-24 00:40:48.673' AS DateTime), NULL, 1)
INSERT [seguridad].[UsuarioHist] ([IdUsuario], [IdHistorico], [FechaIniVig], [FechaFinVig], [Habilitado]) VALUES (3, 1, CAST(N'2019-05-27 00:00:00.000' AS DateTime), NULL, 1)
INSERT [seguridad].[UsuarioHist] ([IdUsuario], [IdHistorico], [FechaIniVig], [FechaFinVig], [Habilitado]) VALUES (4, 1, CAST(N'2019-05-27 00:00:00.000' AS DateTime), NULL, 1)
INSERT [seguridad].[UsuarioHist] ([IdUsuario], [IdHistorico], [FechaIniVig], [FechaFinVig], [Habilitado]) VALUES (5, 1, CAST(N'2019-05-27 00:00:00.000' AS DateTime), CAST(N'2019-05-27 01:10:07.107' AS DateTime), 0)
INSERT [seguridad].[UsuarioHist] ([IdUsuario], [IdHistorico], [FechaIniVig], [FechaFinVig], [Habilitado]) VALUES (5, 2, CAST(N'2019-05-27 00:00:00.000' AS DateTime), NULL, 1)
ALTER TABLE [auditoria].[Acceso]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioLog_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [auditoria].[Acceso] CHECK CONSTRAINT [FK_UsuarioLog_Usuario]
GO
ALTER TABLE [auditoria].[Aplicacion]  WITH CHECK ADD  CONSTRAINT [FK_Aplicacion_Usuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [auditoria].[Aplicacion] CHECK CONSTRAINT [FK_Aplicacion_Usuario]
GO
ALTER TABLE [auditoria].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Acceso] FOREIGN KEY([IdAcceso], [IdUsuario])
REFERENCES [auditoria].[Acceso] ([IdAcceso], [IdUsuario])
GO
ALTER TABLE [auditoria].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Acceso]
GO
ALTER TABLE [auditoria].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Aplicacion] FOREIGN KEY([IdAplicacion])
REFERENCES [auditoria].[Aplicacion] ([IdAplicacion])
GO
ALTER TABLE [auditoria].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Aplicacion]
GO
ALTER TABLE [auditoria].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Funcion] FOREIGN KEY([IdFuncion], [IdAplicacion])
REFERENCES [auditoria].[Funcion] ([IdFuncion], [IdAplicacion])
GO
ALTER TABLE [auditoria].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Funcion]
GO
ALTER TABLE [auditoria].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_TipoBitacora] FOREIGN KEY([IdTipoBitacora])
REFERENCES [auditoria].[TipoBitacora] ([IdTipoBitacora])
GO
ALTER TABLE [auditoria].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_TipoBitacora]
GO
ALTER TABLE [auditoria].[Funcion]  WITH CHECK ADD  CONSTRAINT [FK_Funcion_Aplicacion] FOREIGN KEY([IdAplicacion])
REFERENCES [auditoria].[Aplicacion] ([IdAplicacion])
GO
ALTER TABLE [auditoria].[Funcion] CHECK CONSTRAINT [FK_Funcion_Aplicacion]
GO
ALTER TABLE [auditoria].[Funcion]  WITH CHECK ADD  CONSTRAINT [FK_Funcion_Usuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [auditoria].[Funcion] CHECK CONSTRAINT [FK_Funcion_Usuario]
GO
ALTER TABLE [auditoria].[Parametro]  WITH CHECK ADD  CONSTRAINT [FK_Parametro_Usuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [auditoria].[Parametro] CHECK CONSTRAINT [FK_Parametro_Usuario]
GO
ALTER TABLE [auditoria].[TipoBitacora]  WITH CHECK ADD  CONSTRAINT [FK_TipoBitacora_Usuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [auditoria].[TipoBitacora] CHECK CONSTRAINT [FK_TipoBitacora_Usuario]
GO
ALTER TABLE [dbo].[Seccion]  WITH CHECK ADD  CONSTRAINT [FK_Seccion_TipoSeccion] FOREIGN KEY([IdTipoSeccion])
REFERENCES [dbo].[TipoSeccion] ([IdTipoSeccion])
GO
ALTER TABLE [dbo].[Seccion] CHECK CONSTRAINT [FK_Seccion_TipoSeccion]
GO
ALTER TABLE [dbo].[Seccion]  WITH CHECK ADD  CONSTRAINT [FK_Seccion_Usuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Seccion] CHECK CONSTRAINT [FK_Seccion_Usuario]
GO
ALTER TABLE [dbo].[Seccion]  WITH CHECK ADD  CONSTRAINT [FK_Seccion_Usuario1] FOREIGN KEY([IdUsuarioModificacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Seccion] CHECK CONSTRAINT [FK_Seccion_Usuario1]
GO
ALTER TABLE [gDocumental].[Area]  WITH CHECK ADD  CONSTRAINT [FK_Area_TipoArea] FOREIGN KEY([IdTipoArea])
REFERENCES [gDocumental].[TipoArea] ([IdTipoArea])
GO
ALTER TABLE [gDocumental].[Area] CHECK CONSTRAINT [FK_Area_TipoArea]
GO
ALTER TABLE [gDocumental].[AreaHist]  WITH CHECK ADD  CONSTRAINT [FK_AreaHist_Area] FOREIGN KEY([IdArea])
REFERENCES [gDocumental].[Area] ([IdArea])
GO
ALTER TABLE [gDocumental].[AreaHist] CHECK CONSTRAINT [FK_AreaHist_Area]
GO
ALTER TABLE [gDocumental].[AreaHist]  WITH CHECK ADD  CONSTRAINT [FK_AreaHist_Usuario] FOREIGN KEY([IdUsuarioModificacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [gDocumental].[AreaHist] CHECK CONSTRAINT [FK_AreaHist_Usuario]
GO
ALTER TABLE [gDocumental].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_Documento_SubArea] FOREIGN KEY([IdSubArea])
REFERENCES [gDocumental].[SubArea] ([IdSubArea])
GO
ALTER TABLE [gDocumental].[Documento] CHECK CONSTRAINT [FK_Documento_SubArea]
GO
ALTER TABLE [gDocumental].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_Documento_TipoDocumento] FOREIGN KEY([IdTipoDocumento])
REFERENCES [gDocumental].[TipoDocumento] ([IdTipoDocumento])
GO
ALTER TABLE [gDocumental].[Documento] CHECK CONSTRAINT [FK_Documento_TipoDocumento]
GO
ALTER TABLE [gDocumental].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_Documento_Usuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [gDocumental].[Documento] CHECK CONSTRAINT [FK_Documento_Usuario]
GO
ALTER TABLE [gDocumental].[DocumentoHist]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoHist_Documento] FOREIGN KEY([IdDocumento])
REFERENCES [gDocumental].[Documento] ([IdDocumento])
GO
ALTER TABLE [gDocumental].[DocumentoHist] CHECK CONSTRAINT [FK_DocumentoHist_Documento]
GO
ALTER TABLE [gDocumental].[DocumentoHist]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoHist_Usuario] FOREIGN KEY([IdUsuarioModificacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [gDocumental].[DocumentoHist] CHECK CONSTRAINT [FK_DocumentoHist_Usuario]
GO
ALTER TABLE [gDocumental].[SubArea]  WITH CHECK ADD  CONSTRAINT [FK_SubArea_Area] FOREIGN KEY([IdArea])
REFERENCES [gDocumental].[Area] ([IdArea])
GO
ALTER TABLE [gDocumental].[SubArea] CHECK CONSTRAINT [FK_SubArea_Area]
GO
ALTER TABLE [gDocumental].[SubArea]  WITH CHECK ADD  CONSTRAINT [FK_SubArea_SubArea] FOREIGN KEY([IdPadre])
REFERENCES [gDocumental].[SubArea] ([IdSubArea])
GO
ALTER TABLE [gDocumental].[SubArea] CHECK CONSTRAINT [FK_SubArea_SubArea]
GO
ALTER TABLE [gDocumental].[SubAreaHist]  WITH CHECK ADD  CONSTRAINT [FK_SubAreaHist_SubArea] FOREIGN KEY([IdSubArea])
REFERENCES [gDocumental].[SubArea] ([IdSubArea])
GO
ALTER TABLE [gDocumental].[SubAreaHist] CHECK CONSTRAINT [FK_SubAreaHist_SubArea]
GO
ALTER TABLE [gDocumental].[SubAreaHist]  WITH CHECK ADD  CONSTRAINT [FK_SubAreaHist_Usuario] FOREIGN KEY([IdUsuarioModificacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [gDocumental].[SubAreaHist] CHECK CONSTRAINT [FK_SubAreaHist_Usuario]
GO
ALTER TABLE [seguridad].[Parametro]  WITH CHECK ADD  CONSTRAINT [FK_Parametro_Usuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [seguridad].[Parametro] CHECK CONSTRAINT [FK_Parametro_Usuario]
GO
ALTER TABLE [seguridad].[Permiso]  WITH CHECK ADD  CONSTRAINT [FK_Permiso_Area] FOREIGN KEY([IdArea])
REFERENCES [gDocumental].[Area] ([IdArea])
GO
ALTER TABLE [seguridad].[Permiso] CHECK CONSTRAINT [FK_Permiso_Area]
GO
ALTER TABLE [seguridad].[Permiso]  WITH CHECK ADD  CONSTRAINT [FK_Permiso_Rol] FOREIGN KEY([IdRol])
REFERENCES [seguridad].[Rol] ([IdRol])
GO
ALTER TABLE [seguridad].[Permiso] CHECK CONSTRAINT [FK_Permiso_Rol]
GO
ALTER TABLE [seguridad].[Permiso]  WITH CHECK ADD  CONSTRAINT [FK_Permiso_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [seguridad].[Permiso] CHECK CONSTRAINT [FK_Permiso_Usuario]
GO
ALTER TABLE [seguridad].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Usuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [seguridad].[Usuario] CHECK CONSTRAINT [FK_Usuario_Usuario]
GO
ALTER TABLE [seguridad].[UsuarioHist]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioHist_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [seguridad].[Usuario] ([IdUsuario])
GO
ALTER TABLE [seguridad].[UsuarioHist] CHECK CONSTRAINT [FK_UsuarioHist_Usuario]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de usuario' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Acceso', @level2type=N'COLUMN',@level2name=N'IdUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de log' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Acceso', @level2type=N'COLUMN',@level2name=N'IdAcceso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la sesión o token de autenticación.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Acceso', @level2type=N'COLUMN',@level2name=N'Token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 : Habilitado
0: Des habilitado' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Acceso', @level2type=N'COLUMN',@level2name=N'TokenHabilitado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha que se crea el registro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Acceso', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de log' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'AccesoError', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de usuario' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'AccesoError', @level2type=N'COLUMN',@level2name=N'Usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'AccesoError', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'AccesoError', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rastro de llamadas en caso de error.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'AccesoError', @level2type=N'COLUMN',@level2name=N'Pila'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Serializado de la excepción.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'AccesoError', @level2type=N'COLUMN',@level2name=N'Excepcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha que se crea el registro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'AccesoError', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la aplicación' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Aplicacion', @level2type=N'COLUMN',@level2name=N'IdAplicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del aplicativo en 6 caracteres' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Aplicacion', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la aplicación.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Aplicacion', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Habilitar bitacora de los response, esta funcionalidad es aplicable de los servicios web.
1: Habilitado.
0: Inhabilitado.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Aplicacion', @level2type=N'COLUMN',@level2name=N'HabilitarBitacoraResp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Habilitar bitacora de los request, esta funcionalidad es aplicable de los servicios web.
1: Habilitado.
0: Inhabilitado.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Aplicacion', @level2type=N'COLUMN',@level2name=N'HabilitarBitacoraReq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Habilitar bitacora de las excepciones.
1: Habilitado.
0: Inhabilitado.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Aplicacion', @level2type=N'COLUMN',@level2name=N'HabilitarBitacoraEx'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del registro' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Aplicacion', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del usuario de creación' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Aplicacion', @level2type=N'COLUMN',@level2name=N'IdUsuarioCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de bitacora.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'IdBitacora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del usuario.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'IdUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de Acceso.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'IdAcceso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la aplicación.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'IdAplicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de función.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'IdFuncion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código tipo de log.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'IdTipoBitacora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rastro de llamadas en caso de error.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'Pila'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del registro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Bitacora', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la aplicación.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Funcion', @level2type=N'COLUMN',@level2name=N'IdAplicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la función / operación.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Funcion', @level2type=N'COLUMN',@level2name=N'IdFuncion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la función o operación.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Funcion', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del registro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Funcion', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario de creación del registro' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Funcion', @level2type=N'COLUMN',@level2name=N'IdUsuarioCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del parametro' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'IdParametro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del parametro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor del parametro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'Valor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del usuario que crea el registro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'IdUsuarioCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en crea el registro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del registro (0: deshabilitado, 1: habilitado).' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'Estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código tipo Bitacora' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'TipoBitacora', @level2type=N'COLUMN',@level2name=N'IdTipoBitacora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre tipo Bitacora' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'TipoBitacora', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del registro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'TipoBitacora', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario de creación del regsitro.' , @level0type=N'SCHEMA',@level0name=N'auditoria', @level1type=N'TABLE',@level1name=N'TipoBitacora', @level2type=N'COLUMN',@level2name=N'IdUsuarioCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del parametro' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'IdParametro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del parametro.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor del parametro.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'Valor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del usuario que crea el registro.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'IdUsuarioCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en crea el registro.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del registro (0: deshabilitado, 1: habilitado).' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Parametro', @level2type=N'COLUMN',@level2name=N'Estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Rol' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Rol', @level2type=N'COLUMN',@level2name=N'IdRol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del rol' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Rol', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el rol está habilitado.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Rol', @level2type=N'COLUMN',@level2name=N'Habilitado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se crea el registro.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Rol', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de usuario' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'IdUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de usuario.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'Usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre completo del usuario.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'NombreCompleto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se registra el usuario en la base de datos.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO

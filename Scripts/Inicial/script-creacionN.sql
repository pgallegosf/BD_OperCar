USE [OpeCar]
GO
/****** Object:  User [usropecar]    Script Date: 07/03/2019 06:12:00 p.m. ******/
CREATE USER [usropecar] FOR LOGIN [usropecar] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [auditoria]    Script Date: 07/03/2019 06:12:00 p.m. ******/
CREATE SCHEMA [auditoria]
GO
/****** Object:  Schema [gDocumental]    Script Date: 07/03/2019 06:12:00 p.m. ******/
CREATE SCHEMA [gDocumental]
GO
/****** Object:  Schema [generalidades]    Script Date: 07/03/2019 06:12:00 p.m. ******/
CREATE SCHEMA [generalidades]
GO
/****** Object:  Schema [seguridad]    Script Date: 07/03/2019 06:12:00 p.m. ******/
CREATE SCHEMA [seguridad]
GO
/****** Object:  Table [auditoria].[Acceso]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[Acceso](
	[IdUsuario] [int] NOT NULL,
	[IdAcceso] [bigint] NOT NULL,
	[HostAdress] [nvarchar](20) NULL,
	[HostName] [nvarchar](20) NULL,
	[Agente] [nvarchar](100) NULL,
	[Token] [nvarchar](500) NOT NULL,
	[TokenHabilitado] [bit] NOT NULL,
	[TokenFechaExp] [datetime] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_UsuarioLog] PRIMARY KEY CLUSTERED 
(
	[IdAcceso] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [auditoria].[AccesoError]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
/****** Object:  Table [auditoria].[Aplicacion]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
	[IdUsuarioCreacion] [int] NOT NULL,
 CONSTRAINT [PK_Aplicacion] PRIMARY KEY CLUSTERED 
(
	[IdAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [auditoria].[Bitacora]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[Bitacora](
	[IdBitacora] [bigint] NULL,
	[IdUsuario] [int] NOT NULL,
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
/****** Object:  Table [auditoria].[Funcion]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[Funcion](
	[IdAplicacion] [int] NOT NULL,
	[IdFuncion] [int] NOT NULL,
	[Nombre] [nvarchar](40) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
 CONSTRAINT [PK_Funcion] PRIMARY KEY CLUSTERED 
(
	[IdFuncion] ASC,
	[IdAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [auditoria].[Parametro]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[Parametro](
	[IdParametro] [int] NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Valor] [nvarchar](512) NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[IdParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [auditoria].[TipoBitacora]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditoria].[TipoBitacora](
	[IdTipoBitacora] [tinyint] NOT NULL,
	[Nombre] [nvarchar](40) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
 CONSTRAINT [PK_TipoBitacora] PRIMARY KEY CLUSTERED 
(
	[IdTipoBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seccion]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NULL,
	[FechaModificacion] [datetime] NULL,
	[RutaMultimedia] [nvarchar](200) NULL,
 CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED 
(
	[IdSeccion] ASC,
	[IdTipoSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoSeccion]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
/****** Object:  Table [gDocumental].[Area]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
/****** Object:  Table [gDocumental].[AreaHist]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[AreaHist](
	[IdArea] [int] NOT NULL,
	[IdHistorial] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[UrlImg] [nvarchar](50) NOT NULL,
	[IdUsuarioModificacion] [int] NULL,
	[FechaModificacion] [datetime] NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_AreaHist] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC,
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[Documento]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[Documento](
	[IdDocumento] [int] NOT NULL,
	[IdSubArea] [int] NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[IdDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[DocumentoHist]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[DocumentoHist](
	[IdDocumento] [int] NOT NULL,
	[IdHistorico] [int] NOT NULL,
	[NombreDocumento] [nvarchar](100) NOT NULL,
	[UrlDocumento] [nvarchar](150) NOT NULL,
	[IdUsuarioModificacion] [int] NULL,
	[FechaModificacion] [datetime] NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_DocumentoHist] PRIMARY KEY CLUSTERED 
(
	[IdDocumento] ASC,
	[IdHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[SubArea]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
/****** Object:  Table [gDocumental].[SubAreaHist]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gDocumental].[SubAreaHist](
	[IdSubArea] [int] NOT NULL,
	[IdHistorial] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[EsUltimo] [bit] NOT NULL,
	[IdUsuarioModificacion] [int] NULL,
	[FechaModificacion] [datetime] NULL,
	[IndicadorHabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_SubAreaHist] PRIMARY KEY CLUSTERED 
(
	[IdSubArea] ASC,
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gDocumental].[TipoArea]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
/****** Object:  Table [gDocumental].[TipoDocumento]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
/****** Object:  Table [generalidades].[Enlace]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
 CONSTRAINT [PK_Enlace] PRIMARY KEY CLUSTERED 
(
	[IdEnlace] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [seguridad].[Parametro]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Parametro](
	[IdParametro] [int] NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Valor] [nvarchar](512) NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[IdParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [seguridad].[Permiso]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Permiso](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [tinyint] NOT NULL,
	[IdArea] [int] NOT NULL,
	[IdHistorico] [int] NOT NULL,
	[IdUsuarioCreacion] [int] NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdRol] ASC,
	[IdArea] ASC,
	[IdHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [seguridad].[Rol]    Script Date: 07/03/2019 06:12:00 p.m. ******/
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
/****** Object:  Table [seguridad].[Usuario]    Script Date: 07/03/2019 06:12:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Usuario] [nvarchar](20) NOT NULL,
	[NombreCompleto] [nvarchar](100) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
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

CREATE TABLE [auditoria].[Aplicacion] (
    [IdAplicacion]          INT            NOT NULL,
    [Codigo]                CHAR (6)       NOT NULL,
    [Nombre]                NVARCHAR (100) NOT NULL,
    [HabilitarBitacoraResp] BIT            NOT NULL,
    [HabilitarBitacoraReq]  BIT            NOT NULL,
    [HabilitarBitacoraEx]   BIT            NOT NULL,
    [FechaCreacion]         DATETIME       NOT NULL,
    [IdUsuarioCreacion]     INT            NOT NULL,
    CONSTRAINT [PK_Aplicacion] PRIMARY KEY CLUSTERED ([IdAplicacion] ASC),
    CONSTRAINT [FK_Aplicacion_Usuario] FOREIGN KEY ([IdUsuarioCreacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Id del usuario de creación', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Aplicacion', @level2type = N'COLUMN', @level2name = N'IdUsuarioCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha de creación del registro', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Aplicacion', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Habilitar bitacora de las excepciones.
1: Habilitado.
0: Inhabilitado.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Aplicacion', @level2type = N'COLUMN', @level2name = N'HabilitarBitacoraEx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Habilitar bitacora de los request, esta funcionalidad es aplicable de los servicios web.
1: Habilitado.
0: Inhabilitado.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Aplicacion', @level2type = N'COLUMN', @level2name = N'HabilitarBitacoraReq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Habilitar bitacora de los response, esta funcionalidad es aplicable de los servicios web.
1: Habilitado.
0: Inhabilitado.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Aplicacion', @level2type = N'COLUMN', @level2name = N'HabilitarBitacoraResp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Nombre de la aplicación.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Aplicacion', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código del aplicativo en 6 caracteres', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Aplicacion', @level2type = N'COLUMN', @level2name = N'Codigo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de la aplicación', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Aplicacion', @level2type = N'COLUMN', @level2name = N'IdAplicacion';


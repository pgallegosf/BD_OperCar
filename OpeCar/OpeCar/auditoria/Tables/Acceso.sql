CREATE TABLE [auditoria].[Acceso] (
    [IdUsuario]       INT            NOT NULL,
    [IdAcceso]        BIGINT         NOT NULL,
    [HostAdress]      NVARCHAR (20)  NULL,
    [HostName]        NVARCHAR (20)  NULL,
    [Agente]          NVARCHAR (100) NULL,
    [Token]           NVARCHAR (500) NOT NULL,
    [TokenHabilitado] BIT            NOT NULL,
    [TokenFechaExp]   DATETIME       NOT NULL,
    [FechaCreacion]   DATETIME       NOT NULL,
    CONSTRAINT [PK_UsuarioLog] PRIMARY KEY CLUSTERED ([IdAcceso] ASC, [IdUsuario] ASC),
    CONSTRAINT [FK_UsuarioLog_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha que se crea el registro.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Acceso', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '1 : Habilitado
0: Des habilitado', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Acceso', @level2type = N'COLUMN', @level2name = N'TokenHabilitado';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de la sesión o token de autenticación.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Acceso', @level2type = N'COLUMN', @level2name = N'Token';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de log', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Acceso', @level2type = N'COLUMN', @level2name = N'IdAcceso';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de usuario', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Acceso', @level2type = N'COLUMN', @level2name = N'IdUsuario';


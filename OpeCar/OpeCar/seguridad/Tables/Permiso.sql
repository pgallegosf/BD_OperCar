CREATE TABLE [seguridad].[Permiso] (
    [IdUsuario]             INT      NOT NULL,
    [IdRol]                 TINYINT  NOT NULL,
    [IdHistorico]           INT      NOT NULL,
    [FechaIniVig]           DATETIME NOT NULL,
    [FechaFinVig]           DATETIME NULL,
    [IdUsuarioCreacion]     INT      NOT NULL,
    [IdUsuarioModificacion] INT      NULL,
    [FechaCreacion]         DATETIME NOT NULL,
    [FechaModificacion]     DATETIME NULL,
    CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED ([IdUsuario] ASC, [IdRol] ASC, [IdHistorico] ASC),
    CONSTRAINT [FK_Permiso_Rol] FOREIGN KEY ([IdRol]) REFERENCES [seguridad].[Rol] ([IdRol]),
    CONSTRAINT [FK_Permiso_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha que se realiza la ultima modificación.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'FechaModificacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha en crea el registro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de usuario qui hizo la ultima modificación al registro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'IdUsuarioModificacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Identificador del usuario que crea el registro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'IdUsuarioCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha fin de vigencia del registro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'FechaFinVig';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha inicio de vigencia del registro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'FechaIniVig';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de historico.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'IdHistorico';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código del rol', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'IdRol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de usuario', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Permiso', @level2type = N'COLUMN', @level2name = N'IdUsuario';


CREATE TABLE [seguridad].[Rol] (
    [IdRol]                 TINYINT       NOT NULL,
    [Nombre]                NVARCHAR (40) NOT NULL,
    [Habilitado]            BIT           NOT NULL,
    [IdUsuarioCreacion]     INT           NOT NULL,
    [IdUsuarioModificacion] INT           NULL,
    [FechaCreacion]         DATETIME      NOT NULL,
    [FechaModificacion]     DATETIME      NULL,
    CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED ([IdRol] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha en que se crea el registro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Rol', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indica si el rol está habilitado.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Rol', @level2type = N'COLUMN', @level2name = N'Habilitado';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Nombre del rol', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Rol', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código del Rol', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Rol', @level2type = N'COLUMN', @level2name = N'IdRol';


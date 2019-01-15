CREATE TABLE [seguridad].[Parametro] (
    [IdParametro]       INT            NOT NULL,
    [Descripcion]       NVARCHAR (150) NOT NULL,
    [Valor]             NVARCHAR (512) NOT NULL,
    [IdUsuarioCreacion] INT            NOT NULL,
    [FechaCreacion]     DATETIME       NOT NULL,
    [Estado]            BIT            NOT NULL,
    CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED ([IdParametro] ASC),
    CONSTRAINT [FK_Parametro_Usuario] FOREIGN KEY ([IdUsuarioCreacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Estado del registro (0: deshabilitado, 1: habilitado).', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Parametro', @level2type = N'COLUMN', @level2name = N'Estado';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha en crea el registro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Parametro', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Identificador del usuario que crea el registro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Parametro', @level2type = N'COLUMN', @level2name = N'IdUsuarioCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Valor del parametro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Parametro', @level2type = N'COLUMN', @level2name = N'Valor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descripción del parametro.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Parametro', @level2type = N'COLUMN', @level2name = N'Descripcion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código del parametro', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Parametro', @level2type = N'COLUMN', @level2name = N'IdParametro';


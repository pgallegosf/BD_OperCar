CREATE TABLE [auditoria].[Funcion] (
    [IdAplicacion]      INT           NOT NULL,
    [IdFuncion]         INT           NOT NULL,
    [Nombre]            NVARCHAR (40) NOT NULL,
    [FechaCreacion]     DATETIME      NOT NULL,
    [IdUsuarioCreacion] INT           NOT NULL,
    CONSTRAINT [PK_Funcion] PRIMARY KEY CLUSTERED ([IdFuncion] ASC, [IdAplicacion] ASC),
    CONSTRAINT [FK_Funcion_Aplicacion] FOREIGN KEY ([IdAplicacion]) REFERENCES [auditoria].[Aplicacion] ([IdAplicacion]),
    CONSTRAINT [FK_Funcion_Usuario] FOREIGN KEY ([IdUsuarioCreacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Usuario de creación del registro', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Funcion', @level2type = N'COLUMN', @level2name = N'IdUsuarioCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha de creación del registro.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Funcion', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Nombre de la función o operación.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Funcion', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de la función / operación.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Funcion', @level2type = N'COLUMN', @level2name = N'IdFuncion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de la aplicación.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Funcion', @level2type = N'COLUMN', @level2name = N'IdAplicacion';


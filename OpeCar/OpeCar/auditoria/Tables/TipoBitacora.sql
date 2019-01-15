CREATE TABLE [auditoria].[TipoBitacora] (
    [IdTipoBitacora]    TINYINT       NOT NULL,
    [Nombre]            NVARCHAR (40) NOT NULL,
    [FechaCreacion]     DATETIME      NOT NULL,
    [IdUsuarioCreacion] INT           NOT NULL,
    CONSTRAINT [PK_TipoBitacora] PRIMARY KEY CLUSTERED ([IdTipoBitacora] ASC),
    CONSTRAINT [FK_TipoBitacora_Usuario] FOREIGN KEY ([IdUsuarioCreacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Usuario de creación del regsitro.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'TipoBitacora', @level2type = N'COLUMN', @level2name = N'IdUsuarioCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha de creación del registro.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'TipoBitacora', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Nombre tipo Bitacora', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'TipoBitacora', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código tipo Bitacora', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'TipoBitacora', @level2type = N'COLUMN', @level2name = N'IdTipoBitacora';


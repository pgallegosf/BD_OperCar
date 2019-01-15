CREATE TABLE [auditoria].[Bitacora] (
    [IdBitacora]     BIGINT        NULL,
    [IdUsuario]      INT           NOT NULL,
    [IdAcceso]       BIGINT        NOT NULL,
    [IdAplicacion]   INT           NOT NULL,
    [IdFuncion]      INT           NULL,
    [IdTipoBitacora] TINYINT       NOT NULL,
    [Codigo]         NVARCHAR (10) NULL,
    [Descripcion]    TEXT          NOT NULL,
    [Pila]           TEXT          NULL,
    [FechaCreacion]  DATETIME      NOT NULL,
    CONSTRAINT [FK_Bitacora_Acceso] FOREIGN KEY ([IdAcceso], [IdUsuario]) REFERENCES [auditoria].[Acceso] ([IdAcceso], [IdUsuario]),
    CONSTRAINT [FK_Bitacora_Aplicacion] FOREIGN KEY ([IdAplicacion]) REFERENCES [auditoria].[Aplicacion] ([IdAplicacion]),
    CONSTRAINT [FK_Bitacora_Funcion] FOREIGN KEY ([IdFuncion], [IdAplicacion]) REFERENCES [auditoria].[Funcion] ([IdFuncion], [IdAplicacion]),
    CONSTRAINT [FK_Bitacora_TipoBitacora] FOREIGN KEY ([IdTipoBitacora]) REFERENCES [auditoria].[TipoBitacora] ([IdTipoBitacora])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha de creación del registro.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Rastro de llamadas en caso de error.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'Pila';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descripción.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'Descripcion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'Codigo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código tipo de log.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'IdTipoBitacora';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de función.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'IdFuncion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de la aplicación.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'IdAplicacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de Acceso.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'IdAcceso';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código del usuario.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'IdUsuario';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de bitacora.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'Bitacora', @level2type = N'COLUMN', @level2name = N'IdBitacora';


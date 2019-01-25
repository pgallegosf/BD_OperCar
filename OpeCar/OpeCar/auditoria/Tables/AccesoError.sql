CREATE TABLE [auditoria].[AccesoError] (
    [Id]            CHAR (26)     NOT NULL,
    [Usuario]       VARCHAR (20)  NOT NULL,
    [HostAdress]    VARCHAR (20)  NULL,
    [HostName]      VARCHAR (20)  NULL,
    [Agente]        VARCHAR (100) NULL,
    [Codigo]        VARCHAR (10)  NULL,
    [Descripcion]   TEXT          NOT NULL,
    [Pila]          TEXT          NULL,
    [Excepcion]     TEXT          NULL,
    [FechaCreacion] DATETIME      NOT NULL,
    CONSTRAINT [PK_AccesoError] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha que se crea el registro.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'AccesoError', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serializado de la excepción.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'AccesoError', @level2type = N'COLUMN', @level2name = N'Excepcion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Rastro de llamadas en caso de error.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'AccesoError', @level2type = N'COLUMN', @level2name = N'Pila';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descripción.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'AccesoError', @level2type = N'COLUMN', @level2name = N'Descripcion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código.', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'AccesoError', @level2type = N'COLUMN', @level2name = N'Codigo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Nombre de usuario', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'AccesoError', @level2type = N'COLUMN', @level2name = N'Usuario';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de log', @level0type = N'SCHEMA', @level0name = N'auditoria', @level1type = N'TABLE', @level1name = N'AccesoError', @level2type = N'COLUMN', @level2name = N'Id';


CREATE TABLE [gDocumental].[Documento] (
    [IdDocumento]           INT      NOT NULL,
    [IdTipoDocumento]       INT      NOT NULL,
    [IdUsuarioCreacion]     INT      NOT NULL,
    [FechaCreacion]         DATETIME NOT NULL,
    [IdUsuarioModificacion] INT      NULL,
    [FechaModificacion]     DATETIME NULL,
    CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED ([IdDocumento] ASC),
    CONSTRAINT [FK_Documento_TipoDocumento] FOREIGN KEY ([IdTipoDocumento]) REFERENCES [gDocumental].[TipoDocumento] ([IdTipoDocumento])
);


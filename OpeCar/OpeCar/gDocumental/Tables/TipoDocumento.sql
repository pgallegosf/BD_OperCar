CREATE TABLE [gDocumental].[TipoDocumento] (
    [IdTipoDocumento]       INT            NOT NULL,
    [Descripción]           NVARCHAR (200) NOT NULL,
    [IdTipoDocumentoPadre]  INT            NULL,
    [Estado]                BIT            NOT NULL,
    [IdUsuarioCreacion]     INT            NOT NULL,
    [FechaCreacion]         DATETIME       NOT NULL,
    [IdUsuarioModificacion] INT            NULL,
    [FechaModificacion]     DATETIME       NULL,
    CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED ([IdTipoDocumento] ASC),
    CONSTRAINT [FK_TipoDocumento_Usuario] FOREIGN KEY ([IdUsuarioModificacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario]),
    CONSTRAINT [FK_TipoDocumento_Usuario1] FOREIGN KEY ([IdUsuarioCreacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


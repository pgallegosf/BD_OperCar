CREATE TABLE [dbo].[Seccion] (
    [IdSeccion]             INT            NOT NULL,
    [IdTipoSeccion]         SMALLINT       NOT NULL,
    [Titulo]                VARCHAR (200)  NOT NULL,
    [Contenido]             TEXT           NULL,
    [IdUsuarioCreacion]     INT            NOT NULL,
    [FechaCreacion]         DATETIME       NOT NULL,
    [IdUsuarioModificacion] INT            NULL,
    [FechaModificacion]     DATETIME       NULL,
    [RutaMultimedia]        NVARCHAR (200) NULL,
    CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED ([IdSeccion] ASC, [IdTipoSeccion] ASC),
    CONSTRAINT [FK_Seccion_TipoSeccion] FOREIGN KEY ([IdTipoSeccion]) REFERENCES [dbo].[TipoSeccion] ([IdTipoSeccion]),
    CONSTRAINT [FK_Seccion_Usuario] FOREIGN KEY ([IdUsuarioCreacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario]),
    CONSTRAINT [FK_Seccion_Usuario1] FOREIGN KEY ([IdUsuarioModificacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


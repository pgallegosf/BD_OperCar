CREATE TABLE [dbo].[TipoSeccion] (
    [IdTipoSeccion] SMALLINT     NOT NULL,
    [Descripcion]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TipoSeccion] PRIMARY KEY CLUSTERED ([IdTipoSeccion] ASC)
);


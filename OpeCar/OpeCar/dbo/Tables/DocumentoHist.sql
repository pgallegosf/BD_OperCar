CREATE TABLE [dbo].[DocumentoHist] (
    [IdDocumento]     INT            NOT NULL,
    [IdHistorico]     INT            NOT NULL,
    [NombreDocumento] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DocumentoHist] PRIMARY KEY CLUSTERED ([IdDocumento] ASC, [IdHistorico] ASC),
    CONSTRAINT [FK_DocumentoHist_Documento] FOREIGN KEY ([IdDocumento]) REFERENCES [gDocumental].[Documento] ([IdDocumento])
);


CREATE TABLE [seguridad].[Usuario] (
    [IdUsuario]         INT            NOT NULL,
    [Usuario]           NVARCHAR (20)  NOT NULL,
    [NombreCompleto]    NVARCHAR (100) NOT NULL,
    [FechaCreacion]     DATETIME       NOT NULL,
    [IdUsuarioCreacion] INT            NOT NULL,
    CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED ([IdUsuario] ASC),
    CONSTRAINT [FK_Usuario_Usuario] FOREIGN KEY ([IdUsuarioCreacion]) REFERENCES [seguridad].[Usuario] ([IdUsuario])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Fecha en que se registra el usuario en la base de datos.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Nombre completo del usuario.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = N'NombreCompleto';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Nombre de usuario.', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = N'Usuario';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Código de usuario', @level0type = N'SCHEMA', @level0name = N'seguridad', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = N'IdUsuario';


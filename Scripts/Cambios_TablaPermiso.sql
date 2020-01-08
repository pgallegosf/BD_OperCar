USE OPECAR 
GO
ALTER TABLE seguridad.Permiso
ADD IdSubArea INT NOT NULL DEFAULT(0);

ALTER TABLE seguridad.Permiso
DROP CONSTRAINT PK_Permiso;

ALTER TABLE seguridad.Permiso
ADD CONSTRAINT PK_Permiso PRIMARY KEY (IdUsuario,IdRol,IdArea,IdHistorico,IdSubArea);

DELETE FROM seguridad.Permiso WHERE IdRol=1 
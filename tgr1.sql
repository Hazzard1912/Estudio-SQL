-- Crear un disparador para actualizar los permisos de documentos al cambiar los permisos de carpeta
CREATE OR REPLACE FUNCTION actualizar_permisos_documento()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE documento
    SET id_permiso = NEW.id_permiso
    WHERE id_carpeta = NEW.id_carpeta;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_actualizar_permisos_documento
AFTER UPDATE ON carpeta
FOR EACH ROW
EXECUTE FUNCTION actualizar_permisos_documento();

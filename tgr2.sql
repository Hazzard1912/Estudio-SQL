-- Crear un disparador para eliminar documentos al eliminar una carpeta
CREATE OR REPLACE FUNCTION eliminar_documentos_al_eliminar_carpeta()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM documento
    WHERE id_carpeta = OLD.id_carpeta;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_eliminar_documentos_al_eliminar_carpeta
AFTER DELETE ON carpeta
FOR EACH ROW
EXECUTE FUNCTION eliminar_documentos_al_eliminar_carpeta();

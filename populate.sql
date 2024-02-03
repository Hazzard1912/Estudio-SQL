-- Propietarios
INSERT INTO propietario (nombre, apellido, direccion, telefono) VALUES
('Juan', 'Perez', 'Calle 123', '123-456-7890'),
('Maria', 'Gomez', 'Avenida XYZ', '987-654-3210'),
('Carlos', 'Lopez', 'Calle ABC', '555-123-4567'),
('Ana', 'Rodriguez', 'Avenida 456', '444-888-9999'),
('Pedro', 'Martinez', 'Calle MNO', '111-222-3333'),
('Luisa', 'Hernandez', 'Avenida UVW', '666-777-8888'),
('Alberto', 'Diaz', 'Calle EFG', '999-888-7777'),
('Laura', 'Santos', 'Avenida LMN', '123-789-4560'),
('Roberto', 'Fernandez', 'Calle HIJ', '456-789-0123'),
('Isabel', 'Jimenez', 'Avenida QRS', '789-012-3456');

-- Discos
INSERT INTO disco (capacidad_gb, marca, modelo) VALUES
(500, 'Seagate', 'Barracuda'),
(1000, 'Western Digital', 'Blue'),
(256, 'Samsung', 'EVO'),
(2000, 'Toshiba', 'X300'),
(500, 'Kingston', 'A2000'),
(1000, 'Crucial', 'MX500'),
(512, 'SanDisk', 'Ultra'),
(2000, 'HGST', 'Deskstar'),
(256, 'ADATA', 'SU800'),
(500, 'Corsair', 'MP510');

-- Permisos
INSERT INTO permisos (lectura, escritura, ejecucion) VALUES
(true, true, false),
(true, true, false),
(true, false, false),
(true, false, true),
(true, true, true),
(true, false, false),
(true, false, false),
(true, true, false),
(true, false, false),
(true, true, true);

-- Carpetas
INSERT INTO carpeta (nombre, id_disco, id_propietario, id_permiso) VALUES
('Documentos Personales', 1, 1, 1),
('Proyectos', 2, 3, 2),
('Fotos', 3, 5, 3),
('Trabajo', 4, 2, 4),
('Backup', 5, 4, 5),
('Videos', 6, 6, 6),
('Música', 7, 8, 7),
('Archivos Importantes', 8, 9, 8),
('Descargas', 9, 7, 9),
('Presentaciones', 10, 10, 10);

-- Archivo
INSERT INTO archivo (nombre, contenido, tamanio_mb, id_carpeta, id_permiso) VALUES
('Documento1.txt', 'Contenido del Documento 1', 5, 1, 1),
('Imagen1.jpg', 'Contenido de la Imagen 1', 10, 3, 2),
('Presentacion1.pptx', 'Contenido de la Presentación 1', 8, 2, 3),
('Contrato2.pdf', 'Contenido del Contrato 2', 3, 4, 4),
('Video1.mp4', 'Contenido del Video 1', 15, 6, 5),
('HojaCalculo1.xlsx', 'Contenido de la Hoja de Cálculo 1', 6, 5, 6),
('Articulo1.docx', 'Contenido del Artículo 1', 7, 7, 7),
('Imagen2.png', 'Contenido de la Imagen 2', 12, 8, 8),
('Documento2.txt', 'Contenido del Documento 2', 4, 9, 9),
('Contrato1.pdf', 'Contenido del Contrato 1', 2, 10, 10);

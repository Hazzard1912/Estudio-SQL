
CREATE TABLE propietario (
    id_propietario SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

CREATE TABLE disco (
    id_disco SERIAL PRIMARY KEY,
    capacidad_gb INT NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50)
);

CREATE TABLE permisos (
    id_permiso SERIAL PRIMARY KEY,
    lectura BOOLEAN DEFAULT false,
    escritura BOOLEAN DEFAULT false,
    ejecucion BOOLEAN DEFAULT false
);

CREATE TABLE carpeta (
    id_carpeta SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_disco INT REFERENCES disco(id_disco),
    id_propietario INT REFERENCES propietario(id_propietario),
	id_permiso INT REFERENCES permisos(id_permiso)
);

CREATE TABLE archivo (
    id_archivo SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    contenido TEXT,
    tamanio_mb INT NOT NULL,
    id_carpeta INT REFERENCES carpeta(id_carpeta),
	id_permiso INT REFERENCES permisos(id_permiso)
);


--HECHO EN HYPERSQL ;)

CREATE TABLE "Estudiantes"(

    "numero_cuenta" VARCHAR(50) PRIMARY KEY,
    "nombre" VARCHAR(100)

);

CREATE TABLE "CARRERAS"(

    "codigo_carrera" VARCHAR(50)PRIMARY KEY,
    "nombre" VARCHAR(100)

);

CREATE TABLE "CARRERAS_ESTUDIANTES"(

    "codigo_carrera" VARCHAR(50),
    "numero_cuenta" VARCHAR(50),
    PRIMARY KEY("codigo_carrera","numero_cuenta")

);

CREATE TABLE "CLASES"(

    "codigo_clase" VARCHAR(50)PRIMARY KEY,
    "nombre"VARCHAR(100),
    "unidades_valorativas" INTEGER

);

CREATE TABLE "CARRERA_CLASES"(

    "codigo_carrera" VARCHAR(50),
    "codigo_clase"VARCHAR(50),
    PRIMARY KEY("codigo_carrera","codigo_clase")

);

CREATE TABLE "SECCIONES"(

    "numero_seccion" VARCHAR(50)PRIMARY KEY,
    "codigo_clase"VARCHAR(50),
    "numero_edificio"INTEGER,
    "numero_aula"INTEGER,
    "hora"TIMESTAMP,
    "periodo"INTEGER

);

CREATE TABLE "ESTUDIANTES_SECCIONES"(

    "numero_cuenta"VARCHAR(50),
    "numero_seccion"VARCHAR(50),
    PRIMARY KEY("numero_cuenta","numero_seccion")

);

CREATE TABLE "DOCENTES"(

    "numero_th"VARCHAR(50)PRIMARY KEY,
    "nombre"VARCHAR(100)

);

CREATE TABLE "SECCIONES_DOCENTES"(

    "numero_seccion"VARCHAR(50),
    "numero_th"VARCHAR(50),
    PRIMARY KEY("numero_seccion","numero_th")

);

CREATE TABLE "AULAS"(

  "numero_aula"INTEGER,
  "numero_edificio"INTEGER,
  "capacidad"INTEGER,
  "es_laboratorio"BOOLEAN,
  PRIMARY KEY("numero_aula","numero_edificio")

);

CREATE TABLE "EDIFICIOS"(

    "numero_edificio"INTEGER PRIMARY KEY,
    "nombre"VARCHAR(100),
    "campus"VARCHAR(100)

);

--CARDINALIDADES 

--TABLA ESTUDIANTES  1:N TABLA CARRERA_ESTUDIANTES
ALTER TABLE "CARRERAS_ESTUDIANTE" ADD FOREIGN KEY("numero_cuenta")REFERENCES "ESTUDIANTES"("numero_cuenta")

--TABLA CARRERAS  1:N TABLA CARRERA_ESTUDIANTES
ALTER TABLE "carreras_estudiantes" ADD FOREIGN KEY ("codigo_carrera") REFERENCES "carreras"("codigo_carrera");

--TABLA CARRERAS 1:N TABLA CARRERA_CLASES
ALTER TABLE "carrera_clases" ADD FOREIGN KEY ("codigo_carrera") REFERENCES "carreras"("codigo_carrera");

--TABLA CLASES 1:N TABLA CARRERA_CLASES
ALTER TABLE "carrera_clases" ADD FOREIGN KEY ("codigo_clase") REFERENCES "clases"("codigo_clase");

--TABLA CLASES 1:N TABLA SECCIONES
ALTER TABLE "secciones" ADD FOREIGN KEY ("codigo_clase") REFERENCES "clases"("codigo_clase");

--TABLA ESTUDIANTES 1:N TABLA ESTUDIANTES_SECCIONES
ALTER TABLE "estudiantes_secciones" ADD FOREIGN KEY ("numero_cuenta") REFERENCES "Estudiantes"("numero_cuenta");

--TABLA SECCIONES 1:N TABLA ESTUDIANTES_SECCIONES
ALTER TABLE "estudiantes_secciones" ADD FOREIGN KEY ("numero_seccion") REFERENCES "secciones"("numero_seccion");

--TABLA SECCIONES 1:N TABLA SECCIONES_DOCENTES
ALTER TABLE "secciones_docentes" ADD FOREIGN KEY ("numero_seccion") REFERENCES "secciones"("numero_seccion");

--TABLA DOCENTES 1:N TABLA SECCIONES DOCENTES
ALTER TABLE "secciones_docentes" ADD FOREIGN KEY ("numero_th") REFERENCES"docentes"("numero_th");

--TABLA EDIFICIOS 1:N TABLA AULAS
ALTER TABLE "aulas" ADD FOREIGN KEY ("numero_edificio") REFERENCES "edificios"("numero_edificio");
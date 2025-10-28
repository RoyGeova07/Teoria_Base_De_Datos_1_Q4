--HECHO EN POSTGRESQL

CREATE TABLE "Estudiantes" (
  "numero_cuenta" varchar PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "carreras" (
  "codigo_carrera" varchar PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "carreras_estudiantes" (
  "codigo_carrera" varchar,
  "numero_cuenta" varchar,
  PRIMARY KEY ("codigo_carrera", "numero_cuenta")
);

CREATE TABLE "clases" (
  "codigo_clase" varchar PRIMARY KEY,
  "nombre" varchar,
  "unidades_valorativas" int
);

CREATE TABLE "carrera_clases" (
  "codigo_carrera" varchar,
  "codigo_clase" varchar,
  PRIMARY KEY ("codigo_carrera", "codigo_clase")
);

CREATE TABLE "secciones" (
  "numero_seccion" varchar PRIMARY KEY,
  "codigo_clase" varchar,
  "numero_edificio" int,
  "numero_aula" int,
  "hora" datetime,
  "periodo" int
);

CREATE TABLE "estudiantes_secciones" (
  "numero_cuenta" varchar,
  "numero_seccion" varchar,
  PRIMARY KEY ("numero_cuenta", "numero_seccion")
);

CREATE TABLE "docentes" (
  "numero_th" varchar PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "secciones_docentes" (
  "numero_seccion" varchar,
  "numero_th" varchar,
  PRIMARY KEY ("numero_seccion", "numero_th")
);

CREATE TABLE "aulas" (
  "numero_aula" int,
  "numero_edificio" int,
  "capacidad" int,
  "es_laboratorio" bool,
  PRIMARY KEY ("numero_aula", "numero_edificio")
);

CREATE TABLE "edificios" (
  "numero_edificio" int PRIMARY KEY,
  "nombre" varchar,
  "campus" varchar
);

ALTER TABLE "carreras_estudiantes" ADD FOREIGN KEY ("numero_cuenta") REFERENCES "Estudiantes" ("numero_cuenta");

ALTER TABLE "carreras_estudiantes" ADD FOREIGN KEY ("codigo_carrera") REFERENCES "carreras" ("codigo_carrera");

ALTER TABLE "carrera_clases" ADD FOREIGN KEY ("codigo_carrera") REFERENCES "carreras" ("codigo_carrera");

ALTER TABLE "carrera_clases" ADD FOREIGN KEY ("codigo_clase") REFERENCES "clases" ("codigo_clase");

ALTER TABLE "secciones" ADD FOREIGN KEY ("codigo_clase") REFERENCES "clases" ("codigo_clase");

ALTER TABLE "estudiantes_secciones" ADD FOREIGN KEY ("numero_cuenta") REFERENCES "Estudiantes" ("numero_cuenta");

ALTER TABLE "estudiantes_secciones" ADD FOREIGN KEY ("numero_seccion") REFERENCES "secciones" ("numero_seccion");

ALTER TABLE "secciones_docentes" ADD FOREIGN KEY ("numero_seccion") REFERENCES "secciones" ("numero_seccion");

ALTER TABLE "secciones_docentes" ADD FOREIGN KEY ("numero_th") REFERENCES "docentes" ("numero_th");

ALTER TABLE "aulas" ADD FOREIGN KEY ("numero_edificio") REFERENCES "edificios" ("numero_edificio");

CREATE TABLE "USUARIOS" (
  "Id_Usuario" bigserial PRIMARY KEY,
  "Nombre_usuario" varchar(70) NOT NULL,
  "Apellido_usuario" varchar(70) NOT NULL,
  "Correo_Electronico_usuario" varchar(70) UNIQUE NOT NULL,
  "Fecha_Registro" timestamp NOT NULL,
  "Salario_Mensual_Base" numeric(14,2) NOT NULL,
  "Estado_usuario" boolean NOT NULL
);

CREATE TABLE "PRESUPUESTO" (
  "Id_Presupuesto" bigserial PRIMARY KEY,
  "Id_Usuario" bigint NOT NULL,
  "Nombre_Descriptivo" varchar(500) NOT NULL,
  "Anios_de_inicio" smallint NOT NULL,
  "Mes_de_inicio" tinyint NOT NULL,
  "Anio_de_fin" smallint NOT NULL,
  "Mes_de_fin" tinyint NOT NULL,
  "Total_de_ingresos" numeric(14,2) NOT NULL,
  "Total_de_gastos" numeric(14,2) NOT NULL,
  "Total_de_ahorro" numeric(14,2) NOT NULL,
  "Fecha_hora_creacion" timestamp NOT NULL,
  "Estado_Presupuesto" varchar(20) NOT NULL
);

CREATE TABLE "CATEGORIA" (
  "Id_Categoria" bigserial PRIMARY KEY,
  "Nombre" varchar(50) NOT NULL,
  "Descripcion_detallada" varchar(500),
  "Tipo_de_categoria" varchar NOT NULL
);

CREATE TABLE "SUBCATEGORIA" (
  "Id_SubCategoria" integer PRIMARY KEY,
  "Id_Categoria" bigint NOT NULL,
  "Nombre_subcategoria" varchar(70) NOT NULL,
  "Estado" boolean NOT NULL DEFAULT true,
  "Por_Defecto" boolean NOT NULL DEFAULT false
);

CREATE TABLE "PRESUPUESTO_DETALLE" (
  "Id_Presupuesto_Detalle" integer PRIMARY KEY,
  "Id_Presupuesto" bigint NOT NULL,
  "Id_Subcategoria" bigint NOT NULL,
  "monto_mensual" numeric(14,2) NOT NULL,
  "Presupuesto_al_que_pertenece" varchar(70) NOT NULL,
  "Justificacion_del_monto" varchar(500)
);

CREATE TABLE "OBLIGACION_FIJA" (
  "Id_Obligacion_fija" integer PRIMARY KEY,
  "Usuario_propietario" bigint NOT NULL,
  "id_Subcategoria" bigint NOT NULL,
  "Nombre" varchar(70) NOT NULL,
  "Descripcion_detallada" varchar(500),
  "Monto_fijo_mensual" numeric(14,2) NOT NULL,
  "Dia_del_mes_de_vencimiento" smallint NOT NULL,
  "Esta_vingente" boolean NOT NULL DEFAULT true,
  "Fecha_inicio_de_la_oblidacion" date NOT NULL,
  "Fecha_de_inicializacion" date
);

CREATE TABLE "TRANSACCION" (
  "Id_Trasaccion" integer PRIMARY KEY,
  "Usuario" bigint NOT NULL,
  "id_Presupuesto" bigint NOT NULL,
  "Anio" smallint NOT NULL,
  "Mes" smallint NOT NULL,
  "id_SubCategoria" bigint NOT NULL,
  "Id_Obligacion" bigint NOT NULL,
  "Tipo_de_transaccion" varchar NOT NULL,
  "Descripcion" varchar(500),
  "Monto" numeric(14,2) NOT NULL,
  "Fecha" date NOT NULL,
  "Metodo_de_pago" varchar(30) NOT NULL,
  "Fecha_hora_registro" timestamp NOT NULL
);

CREATE TABLE "META_AHORRO" (
  "Id_Ahorro" integer PRIMARY KEY,
  "Id_usuario" bigint NOT NULL,
  "Subcategoria_del_ahorro" bigint NOT NULL,
  "Nombre" varchar(70) NOT NULL,
  "Descripcion_detallada" varchar(500),
  "Monto_total_alcanzar" numeric(14,2) NOT NULL,
  "Monto_ahorrado" numeric(14,2) NOT NULL,
  "Fecha_inicio" date NOT NULL,
  "Fecha_objetvio" date NOT NULL,
  "Prioridad" varchar(10) NOT NULL,
  "Estado" varchar(10) NOT NULL
);

CREATE TABLE "ALERTA" (
  "Id_alerta" integer PRIMARY KEY,
  "Id_Usuario" bigint NOT NULL,
  "Id_Detalle_presupuesto" bigiint NOT NULL,
  "Id_Obligacion_fija" bigint NOT NULL,
  "Tipo_de_alerta" varchar(40) NOT NULL,
  "Titulo" varchar(70) NOT NULL,
  "Mensaje_descriptivo" varchar(500) NOT NULL,
  "Nivel_de_prioridad" varchar(12) NOT NULL,
  "Fecha_hora_de_creacion" timestamp NOT NULL,
  "indicador_vista_usuario" boolean NOT NULL DEFAULT false,
  "Fecha_hora" timestamp
);

ALTER TABLE "PRESUPUESTO" ADD FOREIGN KEY ("Id_Usuario") REFERENCES "USUARIOS" ("Id_Usuario");

ALTER TABLE "META_AHORRO" ADD FOREIGN KEY ("Id_usuario") REFERENCES "USUARIOS" ("Id_Usuario");

ALTER TABLE "OBLIGACION_FIJA" ADD FOREIGN KEY ("Usuario_propietario") REFERENCES "USUARIOS" ("Id_Usuario");

ALTER TABLE "TRANSACCION" ADD FOREIGN KEY ("Usuario") REFERENCES "USUARIOS" ("Id_Usuario");

ALTER TABLE "ALERTA" ADD FOREIGN KEY ("Id_Usuario") REFERENCES "USUARIOS" ("Id_Usuario");

ALTER TABLE "SUBCATEGORIA" ADD FOREIGN KEY ("Id_Categoria") REFERENCES "CATEGORIA" ("Id_Categoria");

ALTER TABLE "PRESUPUESTO_DETALLE" ADD FOREIGN KEY ("Id_Presupuesto") REFERENCES "PRESUPUESTO" ("Id_Presupuesto");

ALTER TABLE "SUBCATEGORIA" ADD FOREIGN KEY ("Id_SubCategoria") REFERENCES "PRESUPUESTO_DETALLE" ("Id_Subcategoria");

ALTER TABLE "OBLIGACION_FIJA" ADD FOREIGN KEY ("id_Subcategoria") REFERENCES "SUBCATEGORIA" ("Id_SubCategoria");

ALTER TABLE "TRANSACCION" ADD FOREIGN KEY ("id_SubCategoria") REFERENCES "SUBCATEGORIA" ("Id_SubCategoria");

ALTER TABLE "META_AHORRO" ADD FOREIGN KEY ("Subcategoria_del_ahorro") REFERENCES "SUBCATEGORIA" ("Id_SubCategoria");

ALTER TABLE "TRANSACCION" ADD FOREIGN KEY ("id_Presupuesto") REFERENCES "PRESUPUESTO" ("Id_Presupuesto");

ALTER TABLE "ALERTA" ADD FOREIGN KEY ("Id_Detalle_presupuesto") REFERENCES "PRESUPUESTO_DETALLE" ("Id_Presupuesto_Detalle");

ALTER TABLE "TRANSACCION" ADD FOREIGN KEY ("Id_Obligacion") REFERENCES "OBLIGACION_FIJA" ("Id_Obligacion_fija");

ALTER TABLE "ALERTA" ADD FOREIGN KEY ("Id_Obligacion_fija") REFERENCES "OBLIGACION_FIJA" ("Id_Obligacion_fija");

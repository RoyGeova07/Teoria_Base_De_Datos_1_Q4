--SENTENCIA CREANDO LA BASE DE DATOS 
create database CURSO;


--PARA ELIMINAR UNA BASE DE DATOS
--drop database royGeova;

/*
 * para crear una tabla
 * uso bigserial, porque es un numero muy grande que sea autoincrementa, ozea cada vez que se inserte en esta tabla el numero id se va a incrementar
 * ningun numero nulo puede ir aqui, y sera clave primaria, osea que no se puede duplicar el dato 
 * 
 * la coma: ',' nos sirve para separar los campos que vamos creando 
 * 
 * le agregar un limitante al varchar porque de estar forma vamo a optimizar el uso de espacio del disco de nuestra base de datos
 * 
 * para el entero se usa 'integer referenciando a el 'int'
 * 
 */

create table usuarios3(id bigserial not null primary key,nombre varchar(60),apellido varchar(60),edad integer,correo varchar(150));

/*
 *para borrar una tabla se utiliza drop 
 */
--drop table usuarios3;

/*
 * insertando datos via sql
 */
--haciendo esto hace que en la tabla usuarios va a guardar datos q son correspondientes a la columna nombre y apellido
--usando values hago que valores inserto 
insert into usuarios(nombre,apellido,edad,correo)values('Hitler','Peacemaker','56','goku@yahoo.com');


--para hacer consultas se usa SELECT

-- el select le dice al manejador muestrame, el '*' le dice todos, el from  le dice trame todos los datos de la tabla usuarios

--select * from usuarios;

--traeme   todos los datos      de	    la tabla usuarios
--  select         *             from      usuarios;
select * from usuarios;

--para solo mostrar nombre 
select nombre from usuarios;

--para mostrar nombre y apellido
select nombre,apellido from usuarios;


select nombre,apellido "ApellidoUsuario" from usuarios;



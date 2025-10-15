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
insert into usuarios(nombre,apellido,edad,correo)values('Hitler','Peacemaker',56,'goku@yahoo.com');
insert into usuarios(nombre,apellido,edad,correo)values('Juan','Orlando',46,'orlan@gmail.com');
insert into usuarios(nombre,apellido,edad,correo)values('Bill','Gates',57,'coco@gmail.com');


--para hacer consultas se usa SELECT

-- el select le dice al manejador muestrame, el '*' le dice todos, el from  le dice trame todos los datos de la tabla usuarios

--select * from usuarios;

--traeme   todos los datos      de	    la tabla usuarios
--  select         *             from      usuarios;
select * from usuarios;

--para solo mostrar nombre 
--select nombre from usuarios;

--para mostrar nombre y apellido
--select nombre,apellido from usuarios;


select nombre "Nombre Usuario" , apellido "Apellido Usuario", edad , correo as "Email" from usuarios;

--para hacer consultas, usando 'WHERE'
--select * from usuarios where edad=56;

--select * from usuarios where apellido='Gates';

--select * from usuarios where edad>25;
--select*from usuarios where id=2

--traeme todos los nombre que se parecen a tal

/*
 *el "%" hace referencia a lo que sea, por ejemplo si agrego select*from usuarios where nombre like 'ro'
 *buscara dentro de la tabla todos los nombres con ro, roy, roe , row ,ros etc.
 *
 *otro ejemplo seria el correo si agrego select*from usuarios where correo like '%gmail%' 
 *traera todos lo correos que tengan gmail
 */
--select*from usuarios where nombre like 'Hitler';
-----------------------------------------------------------------------------------------------

/*
 * OPERADORES LOGICOS 
 * 
 * OR, NOT, AND
 * 
 * AND: quiero traer a las personas que tengan menos de 30 años y que tengan de gmail
 * 
 * OR: El or va a devolver datos que cumplan con una condicion o con otra condicion de la misma linea de codigo, si se cumple algunas de las 2 codiciones
 * el nos va a traer esos registros 
 * 
 * NOT: El not es una instruccion q nos va a permitir negar las condiciones.
 * Ojo: el not siempre se escribe despues del where 
 * select*from usuarios where not (edad>=30);--los q no son mayores o iguales de 30 años
 * por ende el NOT sirve para invertir los resultados
 * 
*/
--insert into usuarios(nombre,apellido,edad,correo)values('Mono','Araña',77,'oro@hotmail.com');
select*from usuarios where edad>30 and correo like '%gmail%';
select*from usuarios where edad>30 or correo like '%gmail%';
select*from usuarios where edad<30 or correo like '%gmail%';
select*from usuarios where not(edad<30 or correo like '%gmail%');--los menores de 30 o con correo de gmail seran negados
select*from usuarios where not correo like('%outlook%');--no mostrar los datos de los usuarios que tienen correo de outlook
-----------------------------------------------------------------------------------------------------------------------------------

--FUNCIONALIDAD DE ORDER BY
/*
 * El order sirve para ordenar los datos ya sea de formar ascendente o de forma descendente
 * 
 */
select select*from public.usuarios u order by edad asc;--ordenar la edad de forma ascendente
select*from public.usuarios u order by edad desc;--ordernar la edad de forma descendente

select*from public.usuarios u order by apellido asc;--ordenar el apellido de forma alfabeticamente

select*from public.usuarios u order by nombre desc,edad asc;

select*from public.usuarios u order by 2;--se puede tambien ordernar por el numero de la columna 

---------------------------------------------------------------------------------------------------------
--FUNCIONALIDAD UPDATE
/*
 * El update nos permite actualizar registros de una tabla, siempre hay q especificar que vamos a actualizar 
 * siempre que se va actualizar hay q tener cuidado, porque si quieres actualizar algo en especifico se tiene 
 * que utilizar el where, porque si no se utiliza se actulizara toda la tabla 
 * 
 */

--dentro de la tabla usuarios, se actualizara con el nombre josh en donde esta el id 8
update public.usuarios
set nombre='Josh'
where id=8;

update public.usuarios
set nombre='Manuel',correo='Manuel@outlookcom'
where id=10;
----------------------------------------------------------------------------------------------------------


--FUNCIONALIDAD DELETE
/*
 * Obviamente sirve para eliminar tablas, columnas, registros etc
 * y al igual que el update hay que espcificar que se va a borrar 
 * usando el where 
 * 
 * delete from public.usuarios; haciendo esto elimino todos los registros de la tabla usuarios
 * 
 */

delete from public.usuarios 
where id=10;

--eliminar dentro de la tabla usuarios a todos los nombres q tengan 'hit'
delete from public.usuarios
where nombre like '%Hit%';
----------------------------------------------------------------------------------------------------------

--COMANDO LIMIT
/*
 * Sirve para limitar cuantas filas devuelve una consulta
 * 
 * por ejemplo si tengo 10 registros en mi tabla, y solo quiero mostrar 4 registros, ahi es donde se usa el limit
 * mostrando solo 4 registros de la tabla  
 * 
 * el offset sirve para saltarse los registros de una tabla
 * 
 */
select*from public.usuarios u limit 4 offset 2;
select*from public.usuarios u order by id desc limit 4;

--on delete cascade: significa que automaticamente cuando se elimine un usuario de la tabla padre(usuarios), 
--en la tabla hija(direcciones) tambien se eliminara todas las referencias que hay a ese usuario
create table direcciones(
id bigserial primary key not null,
direccion varchar(200)not null,
id_usuario integer,
constraint fk_usuario
	foreign key (id_usuario)
	references usuarios(id)
	on delete cascade 
);





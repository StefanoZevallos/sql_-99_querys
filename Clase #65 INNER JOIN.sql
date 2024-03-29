/*if object_id('libros') is not null
  drop table libros;
if object_id('editoriales') is not null
  drop table editoriales;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
);

create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
);

go

insert into editoriales values('Planeta');
insert into editoriales values('Emece');
insert into editoriales values('Siglo XXI');

insert into libros values('El aleph','Borges',2,20);
insert into libros values('Martin Fierro','Jose Hernandez',1,30);
insert into libros values('Aprenda PHP','Mario Molina',3,50);
insert into libros values('Java en 10 minutos',default,3,45);

-- Recuperamos los datos de libros:
select * from libros;
select * from editoriales

-- Realizamos un join para obtener datos de ambas tablas 
-- (titulo, autor y nombre de la editorial):

		select *
  from libros
  join editoriales
  on codigoeditorial=editoriales.codigo;

 -- Mostramos el c�digo del libro, t�tulo, autor, nombre de la
 -- editorial y el precio realizando un join y empleando alias:
 --
 select l.codigo,titulo,autor,nombre,precio
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo;
  --
	select l.codigo , titulo , autor , nombre , precio  from libros as l
		join editoriales 
		on codigoeditorial=editoriales.codigo

-- Realizamos la misma consulta anterior agregando un "where" 
-- para obtener solamente los libros de la editorial "Siglo XXI":

	select l.codigo , titulo , autor , nombre , precio  from libros as l
		join editoriales 
		on codigoeditorial=editoriales.codigo

-- Obtenemos t�tulo, autor y nombre de la editorial, 
-- esta vez ordenados por t�tulo:
	select * from libros;
	select * from editoriales
	--
	select titulo,autor,nombre from libros
		join editoriales
		on codigoeditorial = editoriales.codigo
		order by titulo*/
		--EJERCICIOS--
 --1- Elimine las tablas "clientes" y "provincias", si existen:
  /*if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 --2- Cr�elas con las siguientes estructuras:
 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );
 go

 --3- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','C�rdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);

 --4- Obtenga los datos de ambas tablas, usando alias:
 
 select * from clientes;
 select * from provincias;
 --
 select * from clientes as a
	join provincias 
	on codigoprovincia =  provincias.codigo
	-- 
	select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo;

 --5- Obtenga la misma informaci�n anterior pero ordenada por nombre de provincia.
  select * from clientes as a
	join provincias 
	on codigoprovincia =  provincias.codigo
	order by provincias.nombre
	
 --6- Recupere los clientes de la provincia "Santa Fe" (2 registros devueltos)
  select * from clientes as a
	join provincias 
	on codigoprovincia =  provincias.codigo
	where provincias.nombre = 'Santa Fe'
	order by provincias.nombre*/
	-- EJERCICIO #2 -- 
--1- Elimine las tablas si existen y cree las tablas:
 if (object_id('inscriptos')) is not null
  drop table inscriptos;
 if (object_id('inasistencias')) is not null
  drop table inasistencias;

 create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha datetime
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into inscriptos values('Juan Perez','22222222','tenis','s');
 insert into inscriptos values('Maria Lopez','23333333','tenis','s');
 insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
 insert into inscriptos values('Marta Garcia','25555555','natacion','s');
 insert into inscriptos values('Juan Perez','22222222','natacion','s');
 insert into inscriptos values('Maria Lopez','23333333','natacion','n');

 insert into inasistencias values('22222222','tenis','2006-12-01');
 insert into inasistencias values('22222222','tenis','2006-12-08');
 insert into inasistencias values('23333333','tenis','2006-12-01');
 insert into inasistencias values('24444444','tenis','2006-12-08');
 insert into inasistencias values('22222222','natacion','2006-12-02');
 insert into inasistencias values('23333333','natacion','2006-12-02');

--3- Muestre el nombre, el deporte y las fechas de inasistencias, ordenado por nombre y deporte.
--Note que la condici�n es compuesta porque para identificar los registros de la tabla "inasistencias" 
--necesitamos ambos campos.

	select * from  inscriptos 
	select * from inasistencias
	--
	select nombre,insc.deporte,ina.fecha
	from inscriptos as insc
	join inasistencias as ina
	on insc.documento=ina.documento and
	insc.deporte=ina.deporte
	order by nombre, insc.deporte;
  --
--4- Obtenga el nombre, deporte y las fechas de inasistencias de un determinado inscripto en un 
--determinado deporte (3 registros)

	select nombre , insc.deporte , ina.fecha
		from inscriptos as insc 
		join inasistencias as ina
		on insc.documento = ina.documento
		and insc.deporte = ina.deporte
		where nombre = 'Juan Perez'
		--
			select nombre,insc.deporte, ina.fecha
			 from inscriptos as insc
			 join inasistencias as ina
			 on insc.documento=ina.documento and
			 insc.deporte=ina.deporte
		    where insc.documento='22222222';

--5- Obtenga el nombre, deporte y las fechas de inasistencias de todos los inscriptos que pagaron la 
--matr�cula(4 registros)
	
	select * from  inscriptos 
	select * from inasistencias
	--
	select nombre,insc.deporte, ina.fecha
			 from inscriptos as insc
			 join inasistencias as ina
			 on insc.documento=ina.documento and
			 insc.deporte=ina.deporte
			 where matricula = 's'
			 --
	select nombre,insc.deporte, ina.fecha
  from inscriptos as insc
  join inasistencias as ina
  on insc.documento=ina.documento and
  insc.deporte=ina.deporte
  where insc.matricula='s';		
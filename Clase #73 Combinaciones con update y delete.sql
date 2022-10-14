if object_id('libros') is not null
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

-- Aumentamos en un 10% los precios de los libros de editorial "Planeta":
select * from libros
select * from editoriales
--
update libros set precio = precio + (0.1 * precio) from libros
	join editoriales as e 
		on e.codigo = codigoeditorial
		where e.nombre = 'planeta'
	

select l.titulo , autor , precio , e.nombre as editorial from libros as l
	join editoriales as e 
		on e.codigo = l.codigoeditorial
	
-- Eliminamos todos los libros de editorial "Emece":
	
	delete  libros from libros 
	join editoriales as e 
		on e.codigo = codigoeditorial
			where e.nombre = 'Emece'
			--
			select l.titulo , autor , precio , e.nombre as editorial from libros as l
	join editoriales as e 
		on e.codigo = l.codigoeditorial
	
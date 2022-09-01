create database EPS;
use EPS;
create table tipos_documentos (
codigo int primary key,
nombre_corto varchar(10),
nombre_largo varchar(100)
);
create table cargos (
codigo int primary key,
nombre varchar(100),
salario int);
create table estados (
codigo int primary key,
nombre varchar(100),
descripcion varchar(1000) 
);
create table ciudades (
codigo int primary key,
nombre varchar(100),
descripcion varchar(1000)
);
create table estratos (
codigo int primary key,
nombre varchar(100)
);
create table generos (
codigo int primary key,
nombre varchar(100)
);
create table patologias (
codigo int primary key,
nombre varchar(100),
descrpcion varchar(1000)
);
create table presentacion(
codigo int primary key,
nombre varchar(100)
);
create table tipo_afiliaciones (
codigo int primary key,
nombre varchar(100),
descripcion varchar(1000)
);
create table especialidades (
codigo int primary key,
nombre varchar(100),
descripcion varchar(1000)
);
create table categorias (
codigo int primary key,
nombre varchar (100),
descripcion varchar (1000)
);
create table tipo_sangre (
RH varchar(5),
recibe varchar(100)
);
create table eps (
codigo int primary key,
nombre varchar (100),
direccion varchar(100),
telefono int,
correo varchar(100)
);
create table ips (
codigo int primary key,
nombre varchar(100),
direccion varchar(100),
telefono int,
correo varchar(100)
);
create table eps_ips (
codigo int primary key,
nombre varchar(100),
ips_codigo int references ips (codigo),
eps_codigo int references eps (codigo)
);
create table medicamentos (
codigo int primary key,
nombre varchar(100),
descripcion varchar(100),
pres_codigo int references presentacion (codigo),
esta_codigo int references estados (codigo)
);
create table sedes (
codigo int primary key,
nombre varchar(100),
direccion varchar(100),
telefono int,
correo varchar(100),
pagina varchar(100),
esp_ips_codigo int references eps_ips (codigo),
serv_codigo int references servicios (codigo),
ciu_codigo int references ciudades (codigo)
);
create table servicios (
codigo int primary key,
nombre varchar(100),
esta_codigo int references estados (codigo),
fecha_estado datetime
);
create table afiliados (
documento varchar(20),
tip_doc_codigo int references tipos_documentos (codigo),
fecha_nacimiento datetime,
primer_nombre varchar(100),
segundo_nombre varchar(100),
primer_apellido varchar(100),
segundo_apellido varchar(100),
direccion varchar(100),
telefono int,
correo varchar(100),
tip_san_RH varchar(5) references tipo_sangre (RH),
gener_codigo int references generos (codigo),
estra_codigo int references estratos (codigo),
tip_afi_codigo int references tipo_afiliaciones (codigo),
ciu_direc_codigo int references ciudades (codigo)
);
create table funcionarios (
documento varchar(20) primary key,
tip_doc_codigo int references tipos_documentos (codigo),
fecha_nacimiento datetime,
primer_nombre varchar(100),
segundo_nombre varchar(100),
primer_apellido varchar(100),
segundo_apellido varchar(100),
direccion varchar(100),
telefono int,
correo varchar(100),
ciu_direc_codigo int references ciudades (codigo),
car_codigo int references cargos (codigo),
gener_codigo int references generos (codigo),
estra_codigo int references estratos (codigo),
categ_codigo int references categorias (codigo),
espec_codigo int references especialidades (codigo)
);
create table citas (
afil_documento varchar(20),
fecha datetime,
func_documento varchar(20),
sede_codigo int,
primary key (afil_documento, fecha)
);
create table estado_afiliados (
codigo int primary key,
afil_documento varchar(20),
esta_codigo int references estados (codigo),
fecha_estado datetime,
descripcion varchar(1000)
);
create table hitoria_clinica (
codigo int primary key,
afil_documento varchar(20) references afiliados (codigo),
fecha datetime,
func_documento varchar(20) references funcionarios (documento),
patol_codigo int references patologias (codigo)
);
create table diagnostico (
hist_clin_codigo int primary key,
med_codigo int references medicamentos (codigo),
cantidad int,
tiempo_medicamento varchar(100),
observaciones varchar(1000),
tiempo_prox_cita varchar(100)
);
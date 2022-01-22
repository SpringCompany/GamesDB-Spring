Create database if not exists `juegos_db`;
use `juegos_db`;

create table generos (
	cod_genero int auto_increment not null,
    nombre varchar (15) not null,
    primary key (cod_genero)
);

create table companies (
	cod_company int auto_increment not null,
    	nombre varchar (20) not null,
	nacionalidad varchar(20) not null,
	primary key (cod_company)
);

Create table juegos (
	cod_juego int auto_increment not null,
    nombre varchar(30) not null,
    fecha_lanzamiento date not null,
    precio double not null,
    genero int not null,
    pegi int not null,
    desarrolladora int not null,
    distribuidora int not null,
    primary key (cod_juego),
    foreign key (desarrolladora) references companies (cod_company),
	foreign key (distribuidora) references companies (cod_company),
    foreign key (genero) references generos (cod_genero)
);

create table jugadores (
	cod_jugador int auto_increment not null,
    nombre varchar (30) not null,
    correo varchar (30) not null,
    edad int not null,
    primary key (cod_jugador)
);

create table jugadores_juegos (
	cod_jugador int not null,
    cod_juego int not null,
    foreign key (cod_juego) references juegos (cod_juego),
    foreign key (cod_jugador) references jugadores (cod_jugador)
);

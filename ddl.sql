drop database if exists provisionamento_acessos;
create database provisionamento_acessos;
use provisionamento_acessos;

create table usuario(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    cargo varchar(50) not null,
    departamento varchar(50) not null,
    status enum('Ativo', 'Inativo') not null default 'Ativo'
);

create table servidor(
    id int not null primary key auto_increment,
    nome varchar(50) not null,
    hostname varchar(100) not null unique,
    ip varchar(45) not null unique,
    sistema_operacional varchar(50) not null,
    ambiente enum('Desenvolvimento', 'Testes', 'Produção') not null
);

create table conta_acesso(
    id int not null primary key auto_increment,
    id_usuario int not null,
    id_servidor int not null,
    login varchar(50) not null,
    status enum('Ativa', 'Bloqueada', 'Cancelada') not null default 'Ativa',
    data_criacao datetime not null,
    data_expiracao datetime
);

create table perfil_permissao(
    id int not null primary key auto_increment,
    nome varchar(50) not null,
    descricao varchar(255),
    nivel_acesso int not null
);

create table acesso(
    id int not null primary key auto_increment,
    id_conta int not null,
    id_perfil int not null,
    data_inicio datetime not null,
    data_fim datetime,
    status enum('Ativo', 'Revogado', 'Expirado') not null default 'Ativo'
);

alter table conta_acesso add constraint fk_conta_usuario foreign key (id_usuario) references usuario(id);
alter table conta_acesso add constraint fk_conta_servidor foreign key (id_servidor) references servidor(id);

alter table acesso add constraint fk_acesso_conta foreign key (id_conta) references conta_acesso(id);
alter table acesso add constraint fk_acesso_perfil foreign key (id_perfil) references perfil_permissao(id);

describe usuario;
describe servidor;
describe conta_acesso;
describe perfil_permissao;
describe acesso;
show tables;
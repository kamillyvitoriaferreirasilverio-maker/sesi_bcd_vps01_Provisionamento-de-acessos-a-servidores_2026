use provisionamento_acessos;

insert into usuario(nome, email, cargo, departamento, status) values
("Percy Jackson", "percy.jackson@gmail.com", "Líder de Operações", "Sistemas", "Ativo"),
("Annabeth Chase", "annabeth.chase@gmail.com", "Arquiteta de Software", "Engenharia", "Ativo"),
("Grover Underwood", "grover.underwood@gmail.com", "Analista de Segurança", "TI", "Ativo"),
("Nico di Angelo", "nico.diangelo@gmail.com", "Administrador de Banco de Dados", "TI", "Ativo");

insert into servidor(nome, hostname, ip, sistema_operacional, ambiente) values
("SRV-Olimpo-DB", "db-olimpo.local", "192.168.1.10", "Ubuntu 22.04 LTS", "Desenvolvimento"),
("SRV-Quiron-TST", "quiron-test.local", "192.168.1.20", "Debian 11", "Testes"),
("SRV-Acampamento-PROD", "prod-01.local", "10.0.0.50", "Red Hat Enterprise Linux 9", "Produção");

insert into conta_acesso(id_usuario, id_servidor, login, status, data_criacao, data_expiracao) values
(1, 1, "pjackson_dev", "Ativa", "2026-01-10 09:00:00", "2026-12-31 23:59:59"),
(2, 3, "achase_admin", "Ativa", "2026-01-15 10:30:00", null),
(3, 2, "gunderwood_sec", "Ativa", "2026-02-01 14:00:00", null),
(4, 1, "ndiangelo_db", "Ativa", "2026-02-10 11:20:00", null);

insert into perfil_permissao(nome, descricao, nivel_acesso) values
("Administrador (Root)", "Acesso total e irrestrito ao sistema", 1),
("Desenvolvedor", "Acesso para Deploy e Leitura de Logs", 3),
("Segurança e Auditoria", "Acesso de monitoramento e análise de vulnerabilidades", 2);

insert into acesso(id_conta, id_perfil, data_inicio, data_fim, status) values
(1, 2, "2026-01-10 09:05:00", "2026-12-31 23:59:59", "Ativo"),
(2, 1, "2026-01-15 10:35:00", null, "Ativo"),
(3, 3, "2026-02-01 14:05:00", null, "Ativo"),
(4, 1, "2026-02-10 11:25:00", null, "Ativo");

select * from usuario;
select * from servidor;
select * from conta_acesso;
select * from perfil_permissao;
select * from acesso;
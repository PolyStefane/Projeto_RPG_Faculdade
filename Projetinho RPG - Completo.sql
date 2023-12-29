CREATE TABLE jogador(
	id int not null,
    nome varchar(60) not null,
    nome_usuario varchar(60) not null,
    email varchar(60) not null,
	data_nasc date,
    data_registro date,
	
    CONSTRAINT jogador_pk PRIMARY KEY (id),
	CONSTRAINT nome_usuario_uk UNIQUE (nome_usuario),
    CONSTRAINT email_uk UNIQUE (email)
);

CREATE TABLE vip(
	data_adesao date,
    nivel_vip varchar(10),
	id_vip int not null,
    
    CONSTRAINT vip_pk PRIMARY KEY (id_vip),
    CONSTRAINT nivel_vip_ck CHECK (nivel_vip in ('Prata', 'Ouro', 'Platina')),
	CONSTRAINT vip_jogador_fk FOREIGN KEY (id_vip) REFERENCES jogador (id)
);

CREATE TABLE campeonato (
	codigo int not null,
    data_camp date,
    horario varchar(10),
    premiacao varchar(20),
    
    CONSTRAINT campeonato_pk PRIMARY KEY (codigo)
);

CREATE TABLE personagem(
	id int not null,
    nome_personagem varchar(60) not null,
    classe varchar(30) not null,
    forca int,
    agilidade int, 
    inteligencia int,
    resistencia int,
    id_jogador int not null,
    
    CONSTRAINT personagem_pk PRIMARY KEY (id),
    CONSTRAINT jogador_personagem_fk FOREIGN KEY (id_jogador) REFERENCES jogador (id),
	CONSTRAINT classe_ck CHECK (classe in ( 'Guerreiro', 'Mago', 'Ranger', 'Ladino', 'Sacerdote', 'Paladino', 'Berseker', 'Necromante', 'Druida', 'Bardo'))
);

CREATE TABLE missao (
	id int auto_increment, 
    nome varchar(40) not null,
    nivel_recomendado int,
    status_missao varchar (30) not null,
    
    
    CONSTRAINT missao_pk PRIMARY KEY (id),
    CONSTRAINT status_ck CHECK (status_missao in ( 'Em andamento', 'Concluida', 'Falha', 'Expirada'))
);

CREATE TABLE item (
	id int auto_increment,
    tipo varchar(30),    -- Escolhi nao colocar como ck pois há muitas variações --
    raridade varchar (30) not null,
    
    CONSTRAINT item_pk PRIMARY KEY (id),
	CONSTRAINT raridade_ck CHECK (raridade in ('Comum', 'Raro', 'Epico', 'Lendario', 'Mistico', 'Divino'))
);


CREATE TABLE alianca (
	id int not null,
	id_missao int not null,
    nome varchar(30) not null,
    descricao varchar(60),
    
    CONSTRAINT alianca_pk PRIMARY KEY (id),
    CONSTRAINT missao_alianca_fk FOREIGN KEY (id_missao) REFERENCES missao (id)
);

CREATE TABLE beneficios_vip (
	id_vip int not null,
    beneficios varchar(30) not null,
    
    CONSTRAINT beneficios_pk PRIMARY KEY (id_vip, beneficios),
    CONSTRAINT vip_beneficios_fk FOREIGN KEY (id_vip) REFERENCES vip (id_vip)
);

CREATE TABLE vip_campeonato (
	id_vip int not null,
    cod_campeonato int not null,
    pontuacao_total int,
    
    CONSTRAINT vip_campeonato_pk PRIMARY KEY (id_vip, cod_campeonato),
    CONSTRAINT vip_campeonato_vip_fk FOREIGN KEY (id_vip) REFERENCES vip (id_vip),
    CONSTRAINT vip_campeonato_campeonato_fk FOREIGN KEY (cod_campeonato) REFERENCES campeonato (codigo)
);

CREATE TABLE personagem_missao (
id_personagem int not null,
id_missao int not null,

CONSTRAINT personagem_missao_pk PRIMARY KEY (id_personagem, id_missao),
CONSTRAINT personagem_missao_personagem_fk FOREIGN KEY (id_personagem) REFERENCES personagem (id),
CONSTRAINT personagem_missao_missao_fk FOREIGN KEY (id_missao) REFERENCES missao (id)
);

CREATE TABLE personagem_item (
id_personagem int not null,
id_item int not null,

CONSTRAINT personagem_item_pk PRIMARY KEY (id_personagem, id_item),
CONSTRAINT personagem_item_personagem_fk FOREIGN KEY (id_personagem) REFERENCES personagem (id),
CONSTRAINT personagem_item_item_fk FOREIGN KEY (id_item) REFERENCES item (id)

);

-- inserindo jogadores --
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc, data_registro)
VALUES (1, 'Elon Musk', 'elonmusk', 'elon@gmail.com', '1971-06-28', '2023-10-20');
INSERT INTO jogador (id, nome, nome_usuario, email)
VALUES (2, 'Oprah Winfrey', 'oprah', 'oprah@gmail.com');
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc)
VALUES (3, 'Dwayne Johnson', 'therock', 'therock@gmail.com', '1972-05-02');
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc)
VALUES (4, 'Michelle Obama', 'michelleo', 'michelle@gmail.com', '1964-01-17');
INSERT INTO jogador (id, nome, nome_usuario, email, data_registro)
VALUES (5, 'Jeff Bezos', 'jeffbezos', 'jeff@gmail.com', '2023-10-20');
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc, data_registro)
VALUES (6, 'Beyoncé', 'beyonce', 'beyonce@gmail.com', '1981-09-04', '2023-10-20');
INSERT INTO jogador (id, nome, nome_usuario, email)
VALUES (7, 'Barack Obama', 'baracko', 'barack@gmail.com');
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc)
VALUES (8, 'Taylor Swift', 'taylorswift', 'taylors@gmail.com', '1989-12-13');
INSERT INTO jogador (id, nome, nome_usuario, email, data_registro)
VALUES (9, 'Bill Gates', 'billgates', 'billg@gmail.com', '2023-10-20');
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc, data_registro)
VALUES (10, 'Ellen DeGeneres', 'ellend', 'ellen@gmail.com', '1958-01-26', '2023-10-20');
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc)
VALUES (11, 'Angelina Jolie', 'angelinajolie', 'angelina@email.com', '1975-06-04');
INSERT INTO jogador (id, nome, nome_usuario, email, data_registro)
VALUES (12, 'Brad Pitt', 'bradpitt', 'brad@email.com', '2023-10-20');
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc, data_registro)
VALUES (13, 'Jennifer Lawrence', 'jenniferlaw', 'jennifer@email.com', '1969-02-11', '2023-10-20');
INSERT INTO jogador (id, nome, nome_usuario, email, data_registro)
VALUES (14, 'Keanu Reeves', 'keanureeves', 'keanu@email.com', '2023-10-20');
INSERT INTO jogador (id, nome, nome_usuario, email, data_nasc, data_registro)
VALUES (15, 'Scarlett Johansson', 'scarlettjohansson', 'scarlett@email.com', '1984-11-22', '2023-10-20');

-- inserindo vip -- 
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-20', 'Prata', 1);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-20', 'Ouro', 5);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-16', 'Platina', 6);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-19', 'Prata', 7);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-17', 'Platina', 9);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-12', 'Platina', 11);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-12', 'Ouro', 15);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-17', 'Prata', 10);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-20', 'Platina', 3);
INSERT INTO vip (data_adesao, nivel_vip, id_vip)
VALUES ('2023-10-17', 'Ouro', 2);

-- inserindo campeonatos -- 
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (1, '2023-10-25', '15:00', 'Prêmio em dinheiro');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (2, '2023-11-10', '14:30', 'Troféu e medalhas');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (3, '2023-12-05', '16:15', 'Equipamento no jogo ');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (4, '2024-01-20', '19:00', 'Prêmio em viagem');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (5, '2024-02-15', '12:45', 'Prêmio em patrocínio');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (6, '2024-03-05', '17:30', 'Troféu e dinheiro');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (7, '2024-04-10', '14:15', 'Prêmio em cosméticos');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (8, '2024-05-20', '20:30', 'Prêmio em dinheiro');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (9, '2024-06-15', '16:45', 'Viagem internacional');
INSERT INTO campeonato (codigo, data_camp, horario, premiacao)
VALUES (10, '2024-07-10', '16:45', 'Prêmio em itens');

-- inserindo personagens -- 
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (1, 'Aragorn', 'Guerreiro', 85, 40, 25, 70, 1);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (2, 'Gandalf', 'Mago', 20, 35, 90, 30, 2);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (3, 'Legolas', 'Ranger', 40, 75, 35, 45, 3);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (4, 'Thieves Guild Master', 'Ladino', 30, 85, 40, 25, 4);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (5, 'Cleric of Light', 'Sacerdote', 35, 30, 60, 75, 5);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (6, 'Sir Galahad', 'Paladino', 75, 45, 50, 70, 6);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (7, 'Conan the Barbarian', 'Berseker', 90, 30, 20, 65, 7);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (8, 'Morgana Le Fay', 'Necromante', 20, 40, 80, 40, 3);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (9, 'Drizzt Do Urden', 'Ranger', 60, 50, 40, 60, 9);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (10, 'Bardock', 'Bardo', 40, 70, 55, 35, 10);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (11, 'Elric of Melniboné', 'Mago', 30, 35, 95, 20, 11);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (12, 'Raistlin Majere', 'Mago', 25, 40, 90, 30, 12);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (13, 'Artemis Entreri', 'Ranger', 55, 70, 45, 40, 15);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (14, 'Frodo Baggins', 'Ladino', 30, 60, 55, 35, 14);
INSERT INTO personagem (id, nome_personagem, classe, forca, agilidade, inteligencia, resistencia, id_jogador)
VALUES (15, 'Jaina Proudmoore', 'Mago', 40, 35, 90, 25, 15);

-- inserindo missao --
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Resgate da Princesa Perdida', 10, 'Em andamento');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Caça ao Dragão Escamoso', 15, 'Concluida');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Roubo na Cidade', 12, 'Concluida');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Investigação Sobrenatural', 20, 'Em andamento');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Escoltando a Caravana', 8, 'Falha');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('O Tesouro Perdido', 18, 'Em andamento');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Desafio da Arena', 10, 'Concluida');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Perseguição a Contrabandistas', 13, 'Concluida');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Defesa da Fortaleza', 16, 'Em andamento');
INSERT INTO missao (nome, nivel_recomendado, status_missao)
VALUES ('Caça ao Ladrão Famoso', 14, 'Falha');

-- inserindo itens -- 
INSERT INTO item (tipo, raridade)
VALUES ('Espada Longa', 'Raro');
INSERT INTO item (tipo, raridade)
VALUES ('Poção de Cura', 'Comum');
INSERT INTO item (tipo, raridade)
VALUES ('Armadura de Mithril', 'Epico');
INSERT INTO item (tipo, raridade)
VALUES ('Cajado Arcano', 'Raro');
INSERT INTO item (tipo, raridade)
VALUES ('Anel da Invisibilidade', 'Divino');
INSERT INTO item (tipo, raridade)
VALUES ('Pergaminho de Feitiços', 'Epico');
INSERT INTO item (tipo, raridade)
VALUES ('Amuleto da Vida Eterna', 'Lendario');
INSERT INTO item (tipo, raridade)
VALUES ('Flechas de Fogo', 'Raro');
INSERT INTO item (tipo, raridade)
VALUES ('Poção de Veneno', 'Comum');
INSERT INTO item (tipo, raridade)
VALUES ('Espada Lendária', 'Lendario');
INSERT INTO item (tipo, raridade)
VALUES ('Colar da Sabedoria', 'Mistico');
 
-- inserindo alianças -- 
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (1, 1, 'Companhia dos Heróis', 'Aliança para resgatar a Princesa');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (2, 2, 'Dragonslayers', 'Aliança para caçar o Dragão');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (3, 3, 'Guilda dos Ladrões', 'Aliança para realizar roubos');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (4, 4, 'Ordem dos Magos', 'Aliança para investigações sobrenaturais');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (5, 5, 'Escolta Segura', 'Aliança para escoltar caravanas');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (6, 6, 'Caçadores de Tesouros', 'Aliança para encontrar tesouros perdidos');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (7, 7, 'Campeões da Arena', 'Aliança para competir na arena');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (8, 8, 'Caçadores de Contrabando', 'Aliança para perseguir contrabandistas');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (9, 9, 'Defensores da Fortaleza', 'Aliança para proteger a fortaleza');
INSERT INTO alianca (id, id_missao, nome, descricao)
VALUES (10, 10, 'Liga dos Caçadores de Ladrões', 'Aliança para caçar ladrões famosos');

-- inserindo os beneficios --
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (1, 'Acesso a áreas exclusivas'); 
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (3, 'Suporte prioritário');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (2, 'Itens exclusivos');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (2, 'Eventos VIP');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (3, 'Acesso antecipado a atts');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (5, 'Descontos especiais em lojas');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (5, 'Assistência personalizada');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (6, 'Convites para festas VIP');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (6, 'Atendimento VIP 24/7');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (5, 'Eventos VIP');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (7, 'Acesso a servidores dedicados');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (15, 'Acesso a servidores dedicados');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (9, 'Acesso a servidores dedicados');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (9, 'Personalização exclusiva');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (10, 'Personalização exclusiva');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (10, 'Eventos VIP');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (11, 'Eventos VIP');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (11, 'Acesso a servidores dedicados');
INSERT INTO beneficios_vip (id_vip, beneficios) VALUES (7, 'Eventos VIP');

-- inserindo relação vip_campeonato --
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (1, 1, 1200);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (3, 3, 950);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (2, 2, 1500);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (3, 4, 1100);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (5, 1, 1300);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (7, 6, 1400);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (6, 8, 1475);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (10, 7, 1350);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (9, 4, 1220);
INSERT INTO vip_campeonato (id_vip, cod_campeonato, pontuacao_total) VALUES (5, 10, 1650);

-- inserindo relação personagem_missao -- 
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (1, 1);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (2, 1);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (3, 2);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (4, 2);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (5, 3);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (6, 4);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (6, 3);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (7, 4);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (8, 8);
INSERT INTO personagem_missao (id_personagem, id_missao) VALUES (9, 10);

-- inserindo relação personagem_item -- 

INSERT INTO personagem_item (id_personagem, id_item) VALUES (1, 1);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (1, 3);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (2, 2);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (3, 4);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (4, 5);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (5, 6);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (6, 7);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (8, 9);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (9, 10);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (10, 1);
INSERT INTO personagem_item (id_personagem, id_item) VALUES (13, 2);

-- updates --
set sql_safe_updates = 0;
UPDATE jogador SET data_nasc = '1962-08-01' WHERE id = 2;							-- inserindo data de nascimento para o jogador que o id é igual a 2 --
UPDATE jogador SET data_registro= '2023-09-01' WHERE data_registro is null;			-- inserindo datas de registro onde está nulo --
UPDATE missao SET nivel_recomendado = 20 WHERE id = 6;								-- mudando o nivel recomendado de 18 para 20 para a missao de id igual a 6 -- 
UPDATE missao SET status_missao = 'Concluida' WHERE id = 9;							-- status passando de 'em andamento' para 'concluida' --
UPDATE vip_campeonato SET pontuacao_total = pontuacao_total * 2 WHERE id_vip = 2;  	-- pontuação dobrada para o usuário de id 2 --
UPDATE vip_campeonato SET pontuacao_total = pontuacao_total * 2 WHERE id_vip = 3;  	-- pontuação dobrada para o usuário de id 3 --
UPDATE personagem SET inteligencia = inteligencia * 1.2 WHERE inteligencia >= 90;  	-- aumento de 20% de poder para quem tem inteligencia maior ou igual a 90 --
UPDATE personagem SET resistencia = null WHERE resistencia <= 25;					-- definindo como null a resistencia dos personagens com resistencia menor ou igual a 25 --
UPDATE personagem SET resistencia = 25 WHERE resistencia is null;					-- voltando para 25 as resistencias que ficaram como null --
UPDATE campeonato SET premiacao = 'Troféu das 17' WHERE horario = '16:45';			-- definindo uma nova premiação para os campeonatos das 16:45 -- 
UPDATE campeonato SET premiacao = 'Troféu 20/19:00' WHERE horario = '19:00' and data_camp = '2024-01-20';	-- definindo uma nova premiação para os campeonatos das '19:00' horas e do dia '2024-01-20' (nesse caso tinha só 1) -- 
	
-- selects -- 
SELECT * FROM jogador;
SELECT * FROM vip;
SELECT * FROM campeonato;
SELECT * FROM personagem;
SELECT * FROM missao;
SELECT * FROM item;
SELECT * FROM alianca;
SELECT * FROM beneficios_vip;
SELECT * FROM vip_campeonato;
SELECT * FROM personagem_missao;
SELECT * FROM personagem_item;



-- consultas --  
-- Liste o nome, nome de usuario e a data de nascimento dos jogadores que nasceram entre 1960 e 1980 --
SELECT nome, nome_usuario, data_nasc FROM jogador 
WHERE year(data_nasc) between 1960 and 1980
ORDER BY data_nasc; 
-- Liste  o id, nome do personagem, classe, inteligencia e resistencia dos personagem que tem mais de 70 de inteligencia e menos de 50 de resistencia -- 
SELECT id, nome_personagem, classe, inteligencia, resistencia FROM personagem 
WHERE inteligencia > 70 and resistencia < 50
ORDER BY inteligencia desc;
-- Liste o id, nome, nivel recomendado e status das missoes que o nivel recomendado é maior que 10 e que o status seja "Concluida" ou que o nivel recomendado seja menor ou igual a 20 e o status missao seja "em andamento" --
SELECT id, nome, nivel_recomendado, status_missao FROM missao
WHERE (nivel_recomendado > 10 and status_missao = "Concluida") or (nivel_recomendado <= 20 and status_missao = "Em andamento")
ORDER BY nivel_recomendado; 

-- Liste o nome dos personagens que começam com a letra L --
SELECT nome_personagem FROM personagem
WHERE nome_personagem LIKE 'A%';
-- Liste em letra maiuscula o nome e também as 5 primeiras letras do nome dos personagem que são da classe 'Mago' --
SELECT UPPER(nome_personagem) , SUBSTR(nome_personagem, 1, 5) as inicio
FROM personagem 
WHERE classe = 'Mago';

-- Liste o ID e o nome dos personagens e o ID e o nome dos jogadores que os mesmos pertencem --
SELECT p.id as id_personagem, p.nome_personagem, j.id as id_jogador, j.nome as nome_jogador
FROM personagem p INNER JOIN jogador j
ON p.id_jogador = j.id;
-- Liste o id e nome da aliança, o id, o nome e o nivel recomendado da missao em que estao vinculadas -- 
SELECT a.id as id_alianca, a.nome as nome_alianca, m.id as id_missao, m.nome as nome_missao, m.nivel_recomendado
FROM alianca a INNER JOIN missao m
ON a.id_missao = m.id;

-- Liste o id e nome dos personagens, o tipo e a raridade do item que ele carrega -- 
SELECT p.id as id_personagem, p.nome_personagem, i.tipo as tipo_item, i.raridade
FROM personagem p INNER JOIN personagem_item pi
ON p.id = pi.id_personagem INNER JOIN item i 
ON pi.id_item = i.id
ORDER BY id_personagem;
-- Liste o nome do jogador, o nivel do seu vip e a pontuação final dele nos campeonatos vip --
SELECT j.nome, v.nivel_vip, vc.pontuacao_total
FROM jogador j INNER JOIN vip v
ON j.id = v.id_vip INNER JOIN vip_campeonato vc ON j.id = vc.id_vip;

-- Liste o nome e o id dos jogadores e o nivel_vip do vip a que pertencem. Inclua na listagem os jogadores que nao possuem nenhum tipo de vip --
SELECT  j.id, j.nome, v.nivel_vip
FROM jogador j LEFT OUTER JOIN vip v 
ON j.id = v.id_vip;
-- Liste o id_vip e nivel_vip do vip e o codigo_campeonato e a pontuacao_total dos campeonatos vip que participaram. Inclua na listagem os vips que nao participaram de nenhum campeonato --
SELECT v.id_vip, v.nivel_vip, vc.cod_campeonato, vc.pontuacao_total
FROM vip v LEFT OUTER JOIN vip_campeonato vc 
ON v.id_vip = vc.id_vip;

-- Liste o nivel_vip, a quantidade de jogadores (id_vip) do vip e a soma da pontuação_total dos campeonatos agrupada por nivel --
SELECT v.nivel_vip, count(v.id_vip) as jogadores_total, sum(vc.pontuacao_total) as soma_pontuacao
FROM vip v LEFT OUTER JOIN vip_campeonato vc 
ON v.id_vip = vc.id_vip
GROUP BY v.nivel_vip;
-- Liste a classe e a soma total de inteligencia dos personagens que possuem inteligencia superior a 50 --
SELECT classe, sum(inteligencia) as soma_inteligencia
FROM personagem
WHERE inteligencia > 50 
GROUP BY classe;

-- Liste o nivel_vip do vip e a media da pontuacao total dos campeonatos, liste apenas as pontuacoes que forem superiores a 1500 --
SELECT v.nivel_vip, avg(vc.pontuacao_total) as media_pontuacao
FROM vip_campeonato vc LEFT JOIN vip v
ON vc.id_vip = v.id_vip
GROUP BY v.nivel_vip
HAVING avg(vc.pontuacao_total) > 1500;
-- Liste o id e nome de usuario do jogador e a media da inteligencia de seus personagens, liste apenas a media dos personagens com inteligencia superior a 60 --
SELECT j.id, j.nome_usuario, round(avg(p.inteligencia),1) as media_inteligencia
FROM jogador j LEFT JOIN personagem p
ON j.id = p.id_jogador
GROUP BY j.id, j.nome_usuario
HAVING avg(inteligencia) > 60
ORDER BY j.id;

-- Liste o id e nome do jogador e a media de inteligencia do seu personagem --
SELECT j.id, j.nome, (SELECT avg(inteligencia) FROM personagem WHERE id_jogador = j.id)
FROM jogador j;
-- Liste o id e o nome dos jogadores que participaram em campeonatos onde a premiação inclui 'Troféu' --
SELECT id, nome
FROM jogador
WHERE id IN (SELECT id_vip FROM vip_campeonato WHERE cod_campeonato IN (SELECT codigo FROM campeonato WHERE premiacao LIKE '%Troféu%'));
-- Liste o id e o nome dos jogadores que possuem mais de um personagem --
SELECT id, nome
FROM jogador
WHERE (SELECT COUNT(*) FROM personagem WHERE id_jogador = jogador.id) > 1;
-- Liste o id e o nome do personagem que esteja participando de uma missao em que o status seja 'Concluida' --
SELECT id, nome_personagem
FROM personagem
WHERE id IN (SELECT DISTINCT id_personagem FROM personagem_missao WHERE id_missao IN (SELECT id FROM missao WHERE status_missao = 'Concluida'));

-- Liste o nome de todos os jogadores em uniao com o nome de todos os personagens --
SELECT nome as dados FROM jogador
UNION 
SELECT nome_personagem FROM personagem;

-- Liste o nome dos jogadores para os quais nao existe um registro de personagem correspondente --
SELECT j.nome FROM jogador j
WHERE NOT EXISTS (SELECT 1 FROM personagem p WHERE p.id_jogador = j.id);

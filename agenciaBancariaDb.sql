CREATE TABLE banco(
	nome VARCHAR(255) NOT NULL,
	codigo CHARACTER(3) NOT NULL,
	id_agencia INTEGER NOT NULL
);

CREATE TABLE agencia(
	numero SERIAL NOT NULL,
	quantidade BIGINT,
	id_endereco INTEGER NOT NULL,
	PRIMARY KEY (numero)
);

CREATE TABLE endereco(
	id SERIAL NOT NULL,
	id_cidade INTEGER NOT NULL,
	logradouro VARCHAR(255) NOT NULL,
	numero VARCHAR(15) NOT NULL,
	complemento VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE cidade(
	id SERIAL NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE cliente(
	id SERIAL NOT NULL,
	id_endereco INTEGER NOT NULL,
	nome VARCHAR(80) NOT NULL,
	cpf CHARACTER(11) NOT NULL,
	data_nascimento DATE NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE conta(
	numero SERIAL NOT NULL,
	id_cliente INTEGER NOT NULL,
	id_tipo_conta INTEGER NOT NULL,
	saldo BIGINT,
	data_inicio DATE NOT null,
	PRIMARY KEY (numero)
);

CREATE TABLE operações(
	id SERIAL NOT NULL,
	id_conta INTEGER NOT NULL,
	id_tipo_tran INTEGER,
	valor NUMERIC(12,6),
	data_tran DATE NOT null,
	PRIMARY KEY (id)
);

CREATE TABLE tipo_tran(
	id SERIAL NOT NULL,
	descricao VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tipo_conta(
	id SERIAL NOT NULL,
	descricao VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE endereco
	ADD CONSTRAINT fk_cidade
	FOREIGN KEY (id_cidade) REFERENCES cidade(id);
	
ALTER TABLE cliente
	ADD CONSTRAINT fk_endereco
	FOREIGN KEY (id_endereco) REFERENCES endereco(id);

ALTER TABLE agencia
	ADD CONSTRAINT fk_endereco
	FOREIGN KEY (id_endereco) REFERENCES endereco(id);

ALTER TABLE cliente
	ADD CONSTRAINT uc_cpf UNIQUE (cpf);
	
ALTER TABLE conta
	ADD CONSTRAINT fk_cliente
	FOREIGN KEY (id_cliente) REFERENCES cliente(id);

ALTER TABLE conta
	ADD CONSTRAINT fk_tipo_conta
	FOREIGN KEY (id_tipo_conta) REFERENCES tipo_conta(id);

ALTER TABLE banco
	ADD CONSTRAINT fk_agencia
	FOREIGN KEY (id_agencia) REFERENCES agencia(numero);

ALTER TABLE operações
	ADD CONSTRAINT fk_tipo_tran
	FOREIGN KEY (id_tipo_tran) REFERENCES tipo_tran(id);

ALTER TABLE operações
	ADD CONSTRAINT fk_conta
	FOREIGN KEY (id_conta) REFERENCES conta(numero);
	

CREATE DATABASE agbancaria;

--DML (DATA MANIPULATION LANGUAGE)
INSERT INTO cidade (descricao)
VALUES
('Recife'),
('Porto Alegre'),
('São Paulo'),
('Manaus'),
('Maringá');

SELECT * FROM cidade;



INSERT INTO agencia (quantidade, id_endereco)
VALUES
(75, 1),
(208, 2),
(45, 3),
(99, 4),
(165, 5);

SELECT * FROM agencia;



INSERT INTO endereco (id_cidade, logradouro, numero, complemento)
VALUES
(1, 'agua funda', '1139', 'casa 3'),
(2, 'costa barros', '282', 'cs 2'),
(3, 'alves de almeida', '142', 'blc a 2 andar'),
(4, 'silva bueno', '944', 'torre a'),
(5, 'ibitirama', '2301', 'torre b');

SELECT * FROM endereco;



INSERT INTO banco (nome, codigo, id_agencia)
VALUES
('itau', 275, 6),
('bradesco', 048, 7),
('santander', 361, 8),
('caixa', 199, 9),
('pan', 552, 10);

SELECT * FROM banco;



INSERT INTO tipo_tran (descricao)
VALUES
('deposito'),
('pagamento');

SELECT * FROM tipo_tran;



INSERT INTO conta (numero, id_cliente, id_tipo_conta, saldo, data_inicio)
VALUES
(1, 11, 2, 366082.492306, '2021-08-19'),
(2, 8, 2, 571005.627467, '2020-09-15'),
(3, 22, 1, 767797.5513, '2022-02-25'),
(4, 15, 1, 448445.281472, '2022-04-09'),
(5, 21, 1, 483845.593551, '2021-03-14'),
(6, 16, 2, 444380.455198, '2020-12-15'),
(7, 30, 1, 547966.153505, '2022-08-01'),
(8, 2, 1, 847442.226975, '2021-01-18'),
(9, 12, 1, 594892.96077, '2022-07-04'),
(10, 23, 2, 108628.668308, '2021-01-30'),
(11, 9, 2, 439776.79811, '2021-10-21'),
(12, 27, 1, 826415.339144, '2021-04-04'),
(13, 16, 2, 706512.366906, '2020-10-22'),
(14, 14, 1, 790789.280294, '2021-05-15'),
(15, 19, 1, 496142.81672, '2022-01-27'),
(16, 20, 1, 545004.329348, '2021-11-06'),
(17, 9, 1, 699413.665345, '2021-10-17'),
(18, 3, 2, 797019.326716, '2021-07-10'),
(19, 1, 2, 296335.453801, '2020-09-15'),
(20, 2, 2, 441149.678946, '2022-05-25'),
(21, 30, 1, 186321.301501, '2021-08-19'),
(22, 5, 1, 866160.016408, '2021-12-27'),
(23, 18, 1, 213644.688475, '2020-12-03'),
(24, 1, 2, 886601.399366, '2021-03-10'),
(25, 6, 1, 113975.168842, '2022-07-05'),
(26, 4, 1, 117702.969788, '2021-02-03'),
(27, 5, 2, 239438.506599, '2021-06-29'),
(28, 28, 1, 536546.316667, '2021-11-12'),
(29, 6, 2, 816048.958123, '2021-07-10'),
(30, 7, 1, 599124.559416, '2020-10-11'),
(31, 4, 1, 709464.762195, '2020-12-02'),
(32, 17, 1, 457460.2304, '2021-03-18'),
(33, 7, 2, 942651.654141, '2021-12-12'),
(34, 5, 1, 558621.831023, '2020-10-24'),
(35, 25, 2, 974556.755528, '2021-02-20'),
(36, 25, 1, 668609.785633, '2021-10-19'),
(37, 18, 1, 294075.473428, '2021-12-07'),
(38, 17, 1, 41655.271706, '2022-03-25'),
(39, 28, 2, 914551.872639, '2022-04-03'),
(40, 13, 1, 351540.630519, '2022-06-09'),
(41, 30, 1, 167672.688325, '2022-05-17'),
(42, 5, 2, 81590.433561, '2021-12-29'),
(43, 4, 1, 593235.591112, '2020-12-22'),
(44, 27, 1, 639555.135791, '2020-10-04'),
(45, 9, 1, 241403.723115, '2022-05-26'),
(46, 20, 1, 927641.805817, '2022-04-22'),
(47, 1, 1, 378689.091405, '2022-02-20'),
(48, 5, 1, 868063.788779, '2022-07-21'),
(49, 10, 1, 264464.248995, '2021-05-02'),
(50, 10, 1, 66643.745967, '2021-10-21');

SELECT * FROM conta;



INSERT INTO tipo_conta (descricao)
VALUES
('corrente'),
('poupança');

SELECT * FROM tipo_conta;



INSERT INTO cliente (id, id_endereco, nome, cpf, data_nascimento)
VALUES
(1, 3, 'Web', 45356096418, '2008-07-13'),
(2, 1, 'Hollie', 86840652917, '2021-08-18'),
(3, 2, 'Allison', 40044185460, '2022-03-07'),
(4, 2, 'Frederica', 51223081039, '2016-02-26'),
(5, 3, 'Earle', 44078353518, '2001-05-20'),
(6, 5, 'Ibby', 57645096877, '2004-10-03'),
(7, 4, 'Harman', 71047671684, '2020-06-16'),
(8, 2, 'Melantha', 45478663376, '2004-01-14'),
(9, 3, 'Jerrilyn', 72710885309, '2004-03-20'),
(10, 1, 'Kennedy', 86406896407, '2019-04-25'),
(11, 1, 'Ignace', 67181023571, '2022-03-23'),
(12, 5, 'Cam', 13105075261, '2003-05-25'),
(13, 2, 'Annamaria', 21421267490, '2016-12-14'),
(14, 2, 'Dorolisa', 84127062440, '2011-03-21'),
(15, 4, 'Elysee', 29127306036, '2018-06-07'),
(16, 5, 'Grannie', 85849946506, '2009-07-04'),
(17, 4, 'Julietta', 27380040488, '2008-01-26'),
(18, 2, 'Arnold', 72120045553, '2011-08-29'),
(19, 1, 'Letitia', 69622830066, '2014-04-14'),
(20, 5, 'Ham', 33147919023, '2005-08-25'),
(21, 1, 'Adolph', 20085342713, '2006-07-28'),
(22, 3, 'Randee', 17786183757, '2001-11-19'),
(23, 1, 'Rochell', 15008583989, '2001-07-28'),
(24, 4, 'Rowney', 87107966548, '2012-11-18'),
(25, 5, 'Kyle', 28234757005, '2007-06-07'),
(26, 3, 'Loree', 44531849711, '2005-12-28'),
(27, 4, 'Candy', 16807959702, '2021-09-08'),
(28, 1, 'Nancey', 85620470473, '2004-11-10'),
(29, 3, 'Claudette', 89647679228, '2001-05-04'),
(30, 4, 'Angy', 58761591273, '2002-07-09');

SELECT * FROM cliente;



--TRANSAÇÕES--
BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (1, 33, 1, 194.20183, '2021-03-20');
UPDATE conta SET saldo = saldo + 194.20183 WHERE numero = 33;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (2, 10, 2, 151.55824, '2021-03-12');
UPDATE conta SET saldo = saldo - 151.55824 WHERE numero = 10;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (3, 39, 2, 390.56801, '2020-11-10');
UPDATE conta SET saldo = saldo + 390.56801 WHERE numero = 39;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (4, 50, 1, 152.2754, '2021-05-02');
UPDATE conta SET saldo = saldo + 152.2754 WHERE numero = 50;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (5, 7, 1, 2741.56145, '2022-04-11');
UPDATE conta SET saldo = saldo - 2741.56145 WHERE numero = 7;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (6, 21, 1, 5795.3297, '2021-05-18');
UPDATE conta SET saldo = saldo - 5795.3297 WHERE numero = 21;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (7, 27, 2, 4012.68073, '2022-05-13');
UPDATE conta SET saldo = saldo - 4012.68073 WHERE numero = 27;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (8, 44, 2, 6679.63384, '2021-03-04');
UPDATE conta SET saldo = saldo + 6679.63384 WHERE numero = 44;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (9, 17, 2, 6544.77895, '2022-03-16');
UPDATE conta SET saldo = saldo + 6544.77895 WHERE numero = 17;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (10, 44, 1, 3897.40635, '2021-01-28');
UPDATE conta SET saldo = saldo - 3897.40635 WHERE numero = 44;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (11, 38, 2, 6081.4234, '2022-02-19');
UPDATE conta SET saldo = saldo + 6081.4234 WHERE numero = 38;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (12, 20, 2, 7953.31067, '2021-02-21');
UPDATE conta SET saldo = saldo + 7953.31067 WHERE numero = 20;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (13, 40, 1, 7864.85267, '2021-07-23');
UPDATE conta SET saldo = saldo + 7864.85267 WHERE numero = 40;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (14, 43, 1, 9309.35588, '2021-04-19');
UPDATE conta SET saldo = saldo - 9309.35588 WHERE numero = 43;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (15, 2, 2, 6360.52568, '2022-08-17');
UPDATE conta SET saldo = saldo - 6360.52568 WHERE numero = 2;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (16, 5, 1, 12.96313, '2022-07-01');
UPDATE conta SET saldo = saldo + 12.96313 WHERE numero = 5;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (17, 28, 1, 1732.46414, '2020-11-28');
UPDATE conta SET saldo = saldo - 1732.46414 WHERE numero = 28;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES 18, 49, 1, 1893.8693, '2021-04-14');
UPDATE conta SET saldo = saldo + 1893.8693 WHERE numero = 49;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (19, 36, 1, 8926.96567, '2020-12-14');
UPDATE conta SET saldo = saldo + 8926.96567 WHERE numero = 36;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (20, 43, 1, 3210.8209, '2021-05-02');
UPDATE conta SET saldo = saldo + 3210.8209 WHERE numero = 43;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (21, 16, 2, 1294.85511, '2021-05-27');
UPDATE conta SET saldo = saldo - 1294.85511 WHERE numero = 16;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (22, 18, 2, 7918.96895, '2022-05-07');
UPDATE conta SET saldo = saldo - 7918.96895 WHERE numero = 18;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (23, 20, 2, 6472.81303, '2022-07-24');
UPDATE conta SET saldo = saldo +  where numero = 20;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (24, 14, 2, 8982.27226, '2020-11-07');
UPDATE conta SET saldo = saldo - 6472.81303 WHERE numero = 14;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (25, 37, 2, 823.9913, '2022-05-10');
UPDATE conta SET saldo = saldo + 823.9913 WHERE numero = 37;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (26, 27, 2, 3448.95548, '2021-07-05');
UPDATE conta SET saldo = saldo + 3448.95548 WHERE numero = 27;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (27, 26, 1, 636.48417, '2020-10-11');
UPDATE conta SET saldo = saldo - 636.48417 WHERE numero = 26;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (28, 25, 1, 557.65835, '2020-11-17');
UPDATE conta SET saldo = saldo - 557.65835 WHERE numero = 25;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (29, 37, 1, 6542.03955, '2021-01-21');
UPDATE conta SET saldo = saldo - 6542.03955 WHERE numero = 37;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (30, 23, 2, 1214.56968, '2022-05-03');
UPDATE conta SET saldo = saldo + 1214.56968 WHERE numero = 23;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (31, 16, 1, 8675.0114, '2022-06-27');
UPDATE conta SET saldo = saldo + 8675.0114 WHERE numero = 16;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (32, 9, 1, 5506.99635, '2021-03-31');
UPDATE conta SET saldo = saldo + 5506.99635 WHERE numero = 9;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (33, 37, 2, 1427.68484, '2022-04-20');
UPDATE conta SET saldo = saldo - 1427.68484 WHERE numero = 37;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (34, 17, 2, 6936.18089, '2021-08-28');
UPDATE conta SET saldo = saldo + 6936.18089 WHERE numero = 17;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (35, 39, 1, 2638.58893, '2021-02-25');
UPDATE conta SET saldo = saldo + 2638.58893 WHERE numero = 39;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (36, 39, 1, 1243.34478, '2021-03-09');
UPDATE conta SET saldo = saldo + 1243.34478 WHERE numero = 39;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (37, 12, 2, 1269.80136, '2021-05-30');
UPDATE conta SET saldo = saldo - 1269.80136 WHERE numero = 12;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (38, 16, 2, 1155.99839, '2021-12-31');
UPDATE conta SET saldo = saldo + 1155.99839 WHERE numero = 16;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (39, 44, 2, 200.56623, '2020-12-15');
UPDATE conta SET saldo = saldo - 200.56623 WHERE numero = 44;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (40, 32, 2, 501.03989, '2021-01-15');
UPDATE conta SET saldo = saldo + 501.03989 WHERE numero = 32;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (41, 14, 2, 5249.76322, '2022-03-17');
UPDATE conta SET saldo = saldo + 5249.76322 WHERE numero = 14;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (42, 29, 1, 6961.67441, '2020-12-09');
UPDATE conta SET saldo = saldo + 6961.67441 WHERE numero = 29;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (43, 15, 1, 9237.88087, '2020-10-24');
UPDATE conta SET saldo = saldo + 9237.88087 WHERE numero = 15;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (44, 46, 1, 1398.26554, '2021-02-02');
UPDATE conta SET saldo = saldo - 1398.26554 WHERE numero = 46;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (45, 48, 2, 890.27179, '2021-10-28');
UPDATE conta SET saldo = saldo + 890.27179 WHERE numero = 48;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (46, 50, 1, 659.6146, '2020-11-14');
UPDATE conta SET saldo = saldo - 659.6146 WHERE numero = 50;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (47, 49, 2, 1702.60082, '2021-02-26');
UPDATE conta SET saldo = saldo + 659.6146 WHERE numero = 49;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (48, 32, 2, 8496.94608, '2021-08-01');
UPDATE conta SET saldo = saldo + 8496.94608 WHERE numero = 32;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (49, 37, 1, 290.01112, '2022-03-18');
UPDATE conta SET saldo = saldo - 290.01112 WHERE numero = 37;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (50, 2, 1, 5433.0695, '2020-08-30');
UPDATE conta SET saldo = saldo + 5433.0695 WHERE numero = 2;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (51, 38, 2, 1886.01194, '2021-12-21');
UPDATE conta SET saldo = saldo - 1886.01194 WHERE numero = 38;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (52, 35, 2, 54.01395, '2022-02-13');
UPDATE conta SET saldo = saldo - 54.01395 WHERE numero = 35;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (53, 21, 2, 4942.65507, '2021-01-10');
UPDATE conta SET saldo = saldo - 4942.65507 WHERE numero = 21;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (54, 9, 1, 3904.75457, '2022-08-14');
UPDATE conta SET saldo = saldo + 3904.75457 WHERE numero = 9;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (55, 16, 2, 7466.45073, '2021-06-24');
UPDATE conta SET saldo = saldo + 7466.45073 WHERE numero = 16;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (56, 6, 2, 9211.33717, '2022-06-25');
UPDATE conta SET saldo = saldo - 9211.33717 WHERE numero = 6;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (57, 22, 2, 7169.09532, '2020-08-28');
UPDATE conta SET saldo = saldo + 7169.09532 WHERE numero = 22;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (58, 48, 2, 4338.34952, '2021-02-25');
UPDATE conta SET saldo = saldo + 4338.34952 WHERE numero = 48;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (59, 45, 2, 9328.26583, '2022-02-20');
UPDATE conta SET saldo = saldo - 9328.26583 WHERE numero = 45;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (60, 32, 2, 6718.14772, '2021-11-30');
UPDATE conta SET saldo = saldo - 6718.14772 WHERE numero = 32;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (61, 43, 2, 2036.073, '2020-12-06');
UPDATE conta SET saldo = saldo + 2036.073 WHERE numero = 643;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (62, 25, 1, 1166.71016, '2021-04-05');
UPDATE conta SET saldo = saldo - 1166.71016 WHERE numero = 25;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (63, 22, 1, 1080.1023, '2022-03-20');
UPDATE conta SET saldo = saldo + 1080.1023 WHERE numero = 22;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (64, 12, 2, 9286.85711, '2021-09-15');
UPDATE conta SET saldo = saldo - 9286.85711 WHERE numero = 12;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (65, 17, 2, 210.13463, '2021-09-26');
UPDATE conta SET saldo = saldo + 210.13463 WHERE numero = 17;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (66, 39, 1, 3342.46932, '2020-10-14');
UPDATE conta SET saldo = saldo + 3342.46932 WHERE numero = 39;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (67, 43, 2, 8593.95624, '2021-05-09');
UPDATE conta SET saldo = saldo + 8593.95624 WHERE numero = 43;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (68, 20, 1, 4483.30378, '2022-01-05');
UPDATE conta SET saldo = saldo - 4483.30378 WHERE numero = 20;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (69, 22, 2, 2890.55479, '2021-10-23');
UPDATE conta SET saldo = saldo - 2890.55479 WHERE numero = 22;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO operações (id, id_conta, id_tipo_tran, valor, data_tran) VALUES (70, 16, 1, 9384.13363, '2021-10-25');
UPDATE conta SET saldo = saldo + 9384.13363 WHERE numero = 16;
COMMIT TRANSACTION;


--CONSULTAS--
SELECT numero, id_cliente FROM conta WHERE id_tipo_conta = 1;


SELECT nome, cpf  FROM cliente LEFT JOIN agencia ON agencia.id_endereco = 3;


SELECT * FROM operações LEFT JOIN agencia WHERE data_tran = '2022%';
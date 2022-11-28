# Create schemas
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;

# Create tables
CREATE TABLE proveidors
(
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50),
    carrer VARCHAR(30),
    numero VARCHAR(5),
    pis VARCHAR(5),
    porta VARCHAR(5),
    ciutat VARCHAR(25),
    codi_postal VARCHAR(5),
    pais VARCHAR(45),
    telefon VARCHAR(15),
    fax VARCHAR(15),
    nif VARCHAR(15),
    PRIMARY KEY(id)
);

CREATE TABLE ulleres
(
    id INT UNSIGNED AUTO_INCREMENT,
    marca VARCHAR(30),
    graduacio_dreta DOUBLE,
    graduacio_esquerra DOUBLE,
    muntura ENUM('FLOTANT', 'PASTA', 'METAL·LICA'),
    color_muntura VARCHAR(20),
    color_vidre_dret VARCHAR(20),
    color_vidre_esquerra VARCHAR(20),
    preu DOUBLE,
    id_proveidor INT UNSIGNED,
    PRIMARY KEY(id)
);

CREATE TABLE clients
(
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50),
    carrer VARCHAR(30),
    numero VARCHAR(5),
    pis VARCHAR(5),
    porta VARCHAR(5),
    ciutat VARCHAR(25),
    codi_postal VARCHAR(5),
    pais VARCHAR(45),
    telefon VARCHAR(15),
    correu_electronic VARCHAR(30),
    data_registre DATETIME,
    PRIMARY KEY(id)
);

CREATE TABLE venda_clients
(
	id INT UNSIGNED AUTO_INCREMENT,
    id_empleat INT UNSIGNED NOT NULL,
    id_client INT UNSIGNED NOT NULL,
    id_ulleres INT UNSIGNED NOT NULL,
    data_venda DATETIME,
    PRIMARY KEY(id)
);

CREATE TABLE empleats
(
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS client_recomana_client
(
    id_client INT UNSIGNED NOT NULL,
    recomanat_per INT UNSIGNED,
    PRIMARY KEY(id_client)
);

# Create FKs
ALTER TABLE ulleres
    ADD    FOREIGN KEY (id_proveidor)
    REFERENCES proveidors(id)
;
    
ALTER TABLE venda_clients
    ADD    FOREIGN KEY (id_empleat)
    REFERENCES empleats(id)
;
    
ALTER TABLE venda_clients
    ADD    FOREIGN KEY (id_ulleres)
    REFERENCES ulleres(id)
;
    
ALTER TABLE venda_clients
    ADD    FOREIGN KEY (id_client)
    REFERENCES clients(id)
;

ALTER TABLE client_recomana_client
    ADD    FOREIGN KEY (id_client)
    REFERENCES clients(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE client_recomana_client
    ADD    FOREIGN KEY (recomanat_per)
    REFERENCES clients(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

# Create Indexes
INSERT INTO proveidors VALUES(1, 'Top ulleres', 'Carrer Valles', '5','','','Vall Luevano del Puerto','54019','España','603136122','','16595778J' );
INSERT INTO proveidors VALUES(2, 'Veo veo', 'Calle Iria', '91','2','A','Godoy','74025','España','694544929','','B51323806');
INSERT INTO proveidors VALUES(3, 'Graduados', 'Plaza Fonseca', '20','1º','D','Villa Hernando','02174','España','678123456','','R0281031E');
INSERT INTO proveidors VALUES(4, 'Travesía Francisco Javier', 'C/ Falsa', '223','','','San Marcos Medio','01035','España','963390491','','D70381769');

INSERT INTO ulleres VALUES(1, 'Ray ban', 1.25, 1.50, 'METAL·LICA', 'negre', 'transparent', 'transparent', 159.99, 2);
INSERT INTO ulleres VALUES(2, 'Oakley', 3.5, 3.5, 'PASTA', 'blau', 'transparent', 'transparent', 139.99, 3);
INSERT INTO ulleres VALUES(3, 'Polaroid', 2.5, 2.5, 'METAL·LICA', 'plata', 'negre', 'negre', 99.99, 2);
INSERT INTO ulleres VALUES(4, 'Hawkers', 0, 0, 'FLOTANT', 'negre', 'transparent', 'transparent', 129.99, 1);
INSERT INTO ulleres VALUES(5, 'Carrera', 1.75, 2, 'PASTA', 'blau', 'transparent', 'transparent', 199.99, 1);

INSERT INTO clients VALUES(1, 'Elsa Sosa', 'Avenida Victoria', '40', 'Bajos','','Los Mateo de las Torres','04661','España','690538135','marco25@rendon.com','2019-06-29 12:52:14');
INSERT INTO clients VALUES(2, 'Bruno Leiva', 'Camino Jan', '22', '1º','B','Ciudad Real','44884','España','751706084','bruno25@carranza.com','2019-07-09 18:34:32');
INSERT INTO clients VALUES(3, 'Claudia Lorente', 'Avenida Ángel', '136', '9º','A','As Martos','64636','España','651706084','bruno25@carranza.com','2020-03-09 13:13:36');
INSERT INTO clients VALUES(4, 'Nayara Raya', 'Travessera Alcaráz', '16', '98º','A','Castellano de Ulla','46342','España','661212184','zayala@example.org','2020-08-16 10:31:25');
INSERT INTO clients VALUES(5, 'Miguel Ángel Correa Segundo', 'Rúa Delacrúz', '3', '3º','','Os Farías del Puerto','33918','España','613322068','aponte.leo@latinmail.com','2019-12-26 11:17:42');
INSERT INTO clients VALUES(6, 'Jorge Vallejo', 'Av Miriam', '9', 'bajo','8','Las Aguirre Medio','19458','España','656550418','jvallejo@hotmail.es','2019-04-10 19:17:59');

INSERT INTO client_recomana_client VALUES (2,1);
INSERT INTO client_recomana_client VALUES (4,1);
INSERT INTO client_recomana_client VALUES (5,2);

INSERT INTO empleats VALUES(1, 'Jose Tomas Pareja');
INSERT INTO empleats VALUES(2, 'Jimena de La Rosa');
INSERT INTO empleats VALUES(3, 'Loreto Cervantes');

INSERT INTO venda_clients VALUES(1, 1, 3, 1, '2021-12-11 17:17:16');
INSERT INTO venda_clients VALUES(2, 1, 4, 3, '2021-02-04 12:54:37');
INSERT INTO venda_clients VALUES(3, 3, 5, 4, '2022-11-18 17:52:40');
INSERT INTO venda_clients VALUES(4, 2, 3, 1, '2022-10-10 14:38:12');
INSERT INTO venda_clients VALUES(5, 2, 5, 1, '2022-04-13 19:44:05');

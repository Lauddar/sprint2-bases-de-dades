# Create schemas
DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;


# Create tables
CREATE TABLE clients
(
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(25),
    cognom1 VARCHAR(25),
    cognom2 VARCHAR(25),
    adreça VARCHAR(50),
    codi_postal VARCHAR(5),
    localitat VARCHAR(25),
    provincia VARCHAR(25),
    telefon VARCHAR(9),
    PRIMARY KEY(id)
);

CREATE TABLE comandes
(
    id_comanda INT UNSIGNED AUTO_INCREMENT,
    id_client INT UNSIGNED,
    data DATETIME,
    tipus ENUM('botigues', 'domicili'),
    pizzes INT UNSIGNED,
    hamburgueses INT UNSIGNED,
    begudes INT UNSIGNED,
    preu DOUBLE NOT NULL,
    botiga INT UNSIGNED NOT NULL,
    PRIMARY KEY(id_comanda)
);

CREATE TABLE productes
(
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(45),
    descripcio VARCHAR(300),
    imatge BLOB,
    tipus ENUM('pizza', 'hamburguesa', 'beguda'),
    preu DOUBLE,
    id_categoria INT UNSIGNED,
    PRIMARY KEY(id)
);

CREATE TABLE detall_comanda
(
    id_comanda INT UNSIGNED NOT NULL,
    id_producte INT UNSIGNED NOT NULL,
    quantitat INT UNSIGNED NOT NULL
);

CREATE TABLE categories_pizza
(
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(45),
    PRIMARY KEY(id)
);

CREATE TABLE botigues
(
    id INT UNSIGNED AUTO_INCREMENT,
    adreça VARCHAR(50),
    codi_postal VARCHAR(5),
    localitat VARCHAR(25),
    provincia VARCHAR(25),
    PRIMARY KEY(id)
);

CREATE TABLE empleats
(
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(25),
    cognom1 VARCHAR(25),
    cognom2 VARCHAR(25),
    nif VARCHAR(9),
    telefon VARCHAR(9),
    id_botiga INT UNSIGNED,
    tipus ENUM('cuiner', 'repartidor'),
    PRIMARY KEY(id)
);

CREATE TABLE lliuraments_domicili
(
    id_comanda INT UNSIGNED NOT NULL UNIQUE,
    id_repartidor INT UNSIGNED NOT NULL,
    entrega DATETIME NOT NULL,
    PRIMARY KEY(id_comanda,id_repartidor)
);


# Create FKs
ALTER TABLE detall_comanda
    ADD    FOREIGN KEY (id_comanda)
    REFERENCES comandes(id_comanda)
;
    
ALTER TABLE detall_comanda
    ADD    FOREIGN KEY (id_producte)
    REFERENCES productes(id)
;
    
ALTER TABLE comandes
    ADD    FOREIGN KEY (id_client)
    REFERENCES clients(id)
;

ALTER TABLE productes
    ADD    FOREIGN KEY (id_categoria)
    REFERENCES categories_pizza(id)
    ON UPDATE CASCADE
;
    
ALTER TABLE comandes
    ADD    FOREIGN KEY (botiga)
    REFERENCES botigues(id)
;
    
ALTER TABLE empleats
    ADD    FOREIGN KEY (id_botiga)
    REFERENCES botigues(id)

;
    
ALTER TABLE lliuraments_domicili
    ADD    FOREIGN KEY (id_repartidor)
    REFERENCES empleats(id)
;

ALTER TABLE lliuraments_domicili
    ADD    FOREIGN KEY (id_comanda)
    REFERENCES clients(id)
;

# Create Indexes
INSERT INTO clients VALUES(1, 'Helena', 'Armijo', 'Garica', 'C/ Rayan, 81, 03º F', '86852', 'San Peláez', 'Toledo', '628252031');
INSERT INTO clients VALUES(2, 'Noelia', 'Armijo', 'Castañeda', 'Paseo José Antonio, 1, 0º D', '69055', 'Sedillo de San Pedro', 'Córdoba', '659237453');
INSERT INTO clients VALUES(3, 'Óscar', 'Heredia', 'Barroso', 'Carrer Montes, 904, Bajo 6º', '35635', 'San Santacruz del Barco', 'Cádiz', '699621916');
INSERT INTO clients VALUES(4, 'José Antonio', 'Altamirano', 'Saldaña', 'Carrer Rayan, 81, 03º F', '86852', 'Vall Bautista del Vallès', 'Asturias', '996805086');
INSERT INTO clients VALUES(5, 'Cristian', 'Andreu', 'Segundo', 'Carrer Soler, 76, 5º B', '84679', 'Ávalos', 'Salamanca', '912625383');
INSERT INTO clients VALUES(6, 'Pedro', 'Delrío', 'Hijo', 'Calle Jurado, 57, 4º B', '98899', 'Almanza', 'Las Palmas', '680162506');

INSERT INTO botigues VALUES (1,'Plaça Jordi, 85, 2º E', '94875', 'Ulla','Cantabria');
INSERT INTO botigues VALUES (2,'Travesía Laia, 13, 8º A', '62312', 'Ozuna','Lugo');

INSERT INTO categories_pizza VALUES (1, 'clásicas');
INSERT INTO categories_pizza VALUES (2, 'verano');

INSERT INTO productes VALUES (1, 'Prosciutto', 'Mozzarela, jamón y queso', '', 'pizza', '9.99', 1);
INSERT INTO productes VALUES (2, 'Tropical', 'Mozzarela, jamón y piña', '', 'pizza', '9.99', 2);
INSERT INTO productes VALUES (3, 'Completa', 'Hamburguesa, lechuga, tomate, queso y bacon', '', 'hamburguesa', '5.99', null);
INSERT INTO productes VALUES (4, '4 quesos', 'Mozzarela, edam, emmental y queso azul', '', 'pizza', '9.99', 1);
INSERT INTO productes VALUES (5, 'Cocacola', 'Cocacola clásica', '', 'beguda', '1.99', null);
INSERT INTO productes VALUES (6, 'Nestea', 'Nestea de limón', '', 'beguda', '1.99', null);

INSERT INTO comandes VALUES(1, 1, '2021-11-26 19:27:48', 'botigues', 2,0,2,23.96,2);
INSERT INTO comandes VALUES(2, 3, '2021-11-30 21:51:12', 'botigues', 1,1,2,19.96,2);
INSERT INTO comandes VALUES(3, 5, '2022-07-19 15:06:43', 'domicili', 2,0,1,21.97,1);
INSERT INTO comandes VALUES(4, 2, '2022-10-21 22:42:15', 'domicili', 0,2,1,13.97,2);
INSERT INTO comandes VALUES(5, 3, '2022-10-21 22:03:24', 'domicili', 4,0,0,23.96,1);

INSERT INTO detall_comanda VALUES (1,1,1);
INSERT INTO detall_comanda VALUES (1,2,1);
INSERT INTO detall_comanda VALUES (1,5,2);
INSERT INTO detall_comanda VALUES (2,2,1);
INSERT INTO detall_comanda VALUES (2,3,1);
INSERT INTO detall_comanda VALUES (2,5,1);
INSERT INTO detall_comanda VALUES (2,6,1);
INSERT INTO detall_comanda VALUES (3,1,1);
INSERT INTO detall_comanda VALUES (3,2,1);
INSERT INTO detall_comanda VALUES (3,6,1);
INSERT INTO detall_comanda VALUES (4,3,2);
INSERT INTO detall_comanda VALUES (4,6,1);
INSERT INTO detall_comanda VALUES (5,1,2);
INSERT INTO detall_comanda VALUES (5,4,2);

INSERT INTO empleats VALUES (1,'Ane', 'Almaráz', 'Rodríguez', '16598099B', '600331096',1, 'cuiner');
INSERT INTO empleats VALUES (2,'Unax', 'Pina', 'Saiz', '10338844E', '661340937',1, 'repartidor');
INSERT INTO empleats VALUES (3,'Tomas', 'Redondo', 'Figueroa', '10083265L', '691114260',2, 'cuiner');
INSERT INTO empleats VALUES (4,'Purificacion', 'Fraile', 'Toribio', '31066883R', '640570604',2, 'repartidor');

INSERT INTO lliuraments_domicili VALUES (3,2,'2022-07-19 15:27:43');
INSERT INTO lliuraments_domicili VALUES (4,2,'2022-10-21 23:01:54');
INSERT INTO lliuraments_domicili VALUES (5,4,'2022-10-21 22:59:15');
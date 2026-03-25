-- Création de la table
CREATE DATABASE IF NOT EXISTS tifosi 
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Création de l'utilisateur admin
CREATE USER IF NOT EXISTS 'tifosi' IDENTIFIED BY 'Password!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi';
FLUSH PRIVILEGES ;

USE tifosi;

-- Tables simples 
CREATE TABLE ingredient (
    id_ingredient INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    CONSTRAINT pk_ingredient PRIMARY KEY (id_ingredient),
    CONSTRAINT uq_ingredient UNIQUE (nom)
);

CREATE TABLE marque (
    id_marque INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    CONSTRAINT pk_marque PRIMARY KEY (id_marque),
    CONSTRAINT uq_marque UNIQUE (nom)
);

CREATE TABLE focaccia (
    id_focaccia INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_focaccia PRIMARY KEY (id_focaccia),
    CONSTRAINT uq_focaccia UNIQUE (nom),
    CONSTRAINT chk_focaccia_prix CHECK (prix > 0)
);

CREATE TABLE client (
    id_client INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    code_postal INT NOT NULL,
    CONSTRAINT pk_client PRIMARY KEY (id_client),
    CONSTRAINT uq_email UNIQUE (email)
);

CREATE TABLE menu (
    id_menu INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_menu PRIMARY KEY (id_menu),
    CONSTRAINT chk_menu_prix CHECK (prix > 0)
);

CREATE TABLE boisson (
  id_boisson INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  id_marque INT NOT NULL,
  CONSTRAINT pk_boisson        PRIMARY KEY (id_boisson),
  CONSTRAINT uq_boisson        UNIQUE (nom),
  CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tables intermédiaires
CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    CONSTRAINT pk_comprend PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_comprend_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_comprend_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_comprend_quantite CHECK (quantite > 0)
);

CREATE TABLE achete (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    CONSTRAINT pk_achete PRIMARY KEY (id_client, id_menu, date_achat), -- Un client peut acheter le même menu à des dates différentes
    CONSTRAINT fk_achete_client FOREIGN KEY (id_client) REFERENCES client(id_client) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_achete_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    CONSTRAINT pk_contient PRIMARY KEY (id_menu, id_boisson),
    CONSTRAINT fk_contient_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_contient_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE constitue (
    id_menu INT NOT NULL,
    id_focaccia INT NOT NULL,
    CONSTRAINT pk_constitue PRIMARY KEY (id_menu, id_focaccia),
    CONSTRAINT fk_constitue_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_constitue_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia) ON DELETE RESTRICT ON UPDATE CASCADE
);
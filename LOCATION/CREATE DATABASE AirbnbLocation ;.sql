CREATE TABLE IF NOT EXISTS client (
    id int PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(255) UNIQUE,
    motdepasse VARCHAR(255),
    adresse VARCHAR(255),
    hote int,
    datecreation DATETIME,
    datemodification DATETIME 
);

CREATE TABLE IF NOT EXISTS region (
    id int PRIMARY KEY,
    nom VARCHAR (255) UNIQUE NOT NULL  
);

CREATE TABLE IF NOT EXISTS services (
    id int PRIMARY KEY,
    libelle VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS typelmmo (
    id int PRIMARY KEY,
    Lib  VARCHAR(255) UNIQUE,
    prixmin int
);

CREATE TABLE IF NOT EXISTS piece (
    id int PRIMARY KEY,
    nom VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS tva (
    id int PRIMARY KEY,
    taux int,
    datedepart DATETIME
);

CREATE TABLE IF NOT EXISTS annonce (
    id int PRIMARY KEY,
    publication int,
    prixHT float,
    adresse VARCHAR(255),
    datecreation DATETIME,
    datemodification DATETIME,
    client_id int, 
    FOREIGN KEY (client_id) REFERENCES client(id),
    typelmmo_id int, 
    FOREIGN KEY (typelmmo_id) REFERENCES typelmmo(id),
    region_id int, 
    FOREIGN KEY (region_id) REFERENCES region(id)
);

CREATE TABLE IF NOT EXISTS photo (
    id int PRIMARY KEY,
    path_chemin VARCHAR (255),
    annonce_id int, 
    FOREIGN KEY (annonce_id) REFERENCES annonce(id)
);

CREATE TABLE IF NOT EXISTS reservation (
    annonce_id int,
    FOREIGN KEY (annonce_id) REFERENCES annonce(id),
    client_id int, 
    FOREIGN KEY (client_id) REFERENCES client(id),
    datedebut DATETIME,
    datefin DATETIME,
    PRIMARY KEY (annonce_id , client_id , datedebut) 
);

CREATE TABLE IF NOT EXISTS posseder (
    piece_id int, 
    quantite int,
    FOREIGN KEY (piece_id) REFERENCES piece(id),
    annonce_id int, 
    FOREIGN KEY (annonce_id) REFERENCES annonce(id)
     );

CREATE TABLE IF NOT EXISTS commentaire(
    id int PRIMARY KEY,
    avis VARCHAR(255),
    note int,
    datemodification DATETIME,
    client_id int NOT NULL, 
    FOREIGN KEY (client_id) REFERENCES client(id),
    annonce_id int,
    FOREIGN KEY (annonce_id) REFERENCES annonce(id)
);

CREATE TABLE IF NOT EXISTS fournir(
    services_id int,
    FOREIGN KEY (services_id) REFERENCES services(id),
    annonce_id int,
    FOREIGN KEY (annonce_id) REFERENCES annonce(id),
    PRIMARY KEY (services_id, annonce_id)
);


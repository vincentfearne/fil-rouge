CREATE DATABASE SoundsTalented;

USE DATABASE SoundsTalented;


CREATE TABLE client(
   cli_id INT NOT NULL AUTO_INCREMENT,
   cli_type VARCHAR(13),
   cli_prenom VARCHAR(50),
   cli_nom VARCHAR(50),
   cli_telephone VARCHAR(15),
   cli_mail VARCHAR(255),
   cli_mdp VARCHAR(50),
   PRIMARY KEY(cli_id)
);

CREATE TABLE categorie(
   cat_id INT NOT NULL AUTO_INCREMENT,
   cat_nom VARCHAR(50),
   cat_id_1 INT,
   PRIMARY KEY(cat_id),
   FOREIGN KEY(cat_id_1) REFERENCES categorie(cat_id)
);

CREATE TABLE fournisseur(
   fou_id INT NOT NULL AUTO_INCREMENT,
   fou_nom VARCHAR(50),
   fou_adresse VARCHAR(255),
   fou_dep VARCHAR(10),
   fou_ville VARCHAR(100),
   fou_pays VARCHAR(50),
   fou_telephone VARCHAR(15),
   PRIMARY KEY(fou_id)
);

CREATE TABLE facture(
   fac_id INT NOT NULL AUTO_INCREMENT,
   fac_date DATE,
   PRIMARY KEY(fac_id)
);

CREATE TABLE adresse(
   ad_id INT NOT NULL AUTO_INCREMENT,
   adresse VARCHAR(255),
   ad_dep VARCHAR(10),
   ad_ville VARCHAR(100),
   ad_pays VARCHAR(50),
   PRIMARY KEY(ad_id)
);

CREATE TABLE produit(
   pro_id INT NOT NULL AUTO_INCREMENT,
   pro_libelle VARCHAR(50),
   pro_description VARCHAR(255),
   pro_prix DECIMAL(8,2),
   pro_photo VARCHAR(255),
   pro_ref VARCHAR(50),
   cat_id INT NOT NULL,
   fou_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(cat_id) REFERENCES categorie(cat_id),
   FOREIGN KEY(fou_id) REFERENCES fournisseur(fou_id)
);

CREATE TABLE commande(
   com_id INT NOT NULL AUTO_INCREMENT,
   com_prix DECIMAL(8,2),
   com_date DATETIME,
   com_date_exp DATE,
   com_statut VARCHAR(10),
   cli_id INT NOT NULL,
   fac_id INT NOT NULL,
   PRIMARY KEY(com_id),
   FOREIGN KEY(cli_id) REFERENCES client(cli_id),
   FOREIGN KEY(fac_id) REFERENCES facture(fac_id)
);

CREATE TABLE detail(
   det_id INT NOT NULL AUTO_INCREMENT,
   det_qte VARCHAR(3),
   pro_id INT NOT NULL,
   com_id INT NOT NULL,
   PRIMARY KEY(det_id),
   UNIQUE(pro_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id)
);

CREATE TABLE possede(
   cli_id INT NOT NULL AUTO_INCREMENT,
   ad_id INT,
   PRIMARY KEY(cli_id, ad_id),
   FOREIGN KEY(cli_id) REFERENCES client(cli_id),
   FOREIGN KEY(ad_id) REFERENCES adresse(ad_id)
);

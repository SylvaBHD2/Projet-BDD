#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: ville
#------------------------------------------------------------

CREATE TABLE ville(
        ID_ville    Int  Auto_increment  NOT NULL ,
        code_postal Int NOT NULL ,
        nom_ville   Varchar (50) NOT NULL
	,CONSTRAINT ville_PK PRIMARY KEY (ID_ville)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: adresse
#------------------------------------------------------------

CREATE TABLE adresse(
        ID_adresse  Int  Auto_increment  NOT NULL ,
        numero_voie Varchar (50) NOT NULL ,
        voie        Varchar (50) NOT NULL ,
        ID_ville    Int NOT NULL
	,CONSTRAINT adresse_PK PRIMARY KEY (ID_adresse)

	,CONSTRAINT adresse_ville_FK FOREIGN KEY (ID_ville) REFERENCES ville(ID_ville)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: mutation
#------------------------------------------------------------

CREATE TABLE mutation(
        ID_mutation     Int  Auto_increment  NOT NULL ,
        nature_mutation Varchar (50) NOT NULL ,
        date_mutation   Date NOT NULL ,
        ID_propriete    Int NOT NULL
	,CONSTRAINT mutation_PK PRIMARY KEY (ID_mutation)

	,CONSTRAINT mutation_propriete_FK FOREIGN KEY (ID_propriete) REFERENCES propriete(ID_propriete)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: natureculture
#------------------------------------------------------------

CREATE TABLE natureculture(
        ID_natureCulture Int  Auto_increment  NOT NULL ,
        type             Varchar (50) NOT NULL
	,CONSTRAINT natureculture_PK PRIMARY KEY (ID_natureCulture)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: propriete
#------------------------------------------------------------

CREATE TABLE propriete(
        ID_propriete     Int  Auto_increment  NOT NULL ,
        valeur_fonciere  Float NOT NULL ,
        type_local       Varchar (50) NOT NULL ,
        surface_reelle   Float NOT NULL ,
        nbr_piece        Int NOT NULL ,
        surface_terrain  Float NOT NULL ,
        ID_adresse       Int NOT NULL ,
        ID_natureCulture Int
	,CONSTRAINT propriete_PK PRIMARY KEY (ID_propriete)

	,CONSTRAINT propriete_adresse_FK FOREIGN KEY (ID_adresse) REFERENCES adresse(ID_adresse)
	,CONSTRAINT propriete_natureculture0_FK FOREIGN KEY (ID_natureCulture) REFERENCES natureculture(ID_natureCulture)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: lot
#------------------------------------------------------------

CREATE TABLE lot(
        ID_lot            Int  Auto_increment  NOT NULL ,
        type_lot          Varchar (50) NOT NULL ,
        surface_carre_lot Float NOT NULL
	,CONSTRAINT lot_PK PRIMARY KEY (ID_lot)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: apparait
#------------------------------------------------------------

CREATE TABLE apparait(
        ID_lot       Int NOT NULL ,
        ID_propriete Int NOT NULL
	,CONSTRAINT apparait_PK PRIMARY KEY (ID_lot,ID_propriete)

	,CONSTRAINT apparait_lot_FK FOREIGN KEY (ID_lot) REFERENCES lot(ID_lot)
	,CONSTRAINT apparait_propriete0_FK FOREIGN KEY (ID_propriete) REFERENCES propriete(ID_propriete)
)ENGINE=InnoDB;


#temptable
CREATE TABLE `finalcsv` (
  `Date mutation` datetime DEFAULT NULL,
  `Nature mutation` text,
  `Valeur fonciere` int DEFAULT NULL,
  `Code postal` int DEFAULT NULL,
  `Commune` text,
  `Surface reelle bati` double DEFAULT NULL,
  `Nombre pieces principales` int DEFAULT NULL,
  `Surface terrain` double DEFAULT NULL,
  `1er lot` text,
  `2eme lot` text,
  `3eme lot` text,
  `4eme lot` text,
  `5eme lot` text,
  `Type local` text,
  `Adresse` text,
  `Voie_Complete` text,
  `Nature culture` text,
  `Surface Carrez du 1er lot` text,
  `Surface Carrez du 2eme lot` text,
  `Surface Carrez du 3eme lot` text,
  `Surface Carrez du 4eme lot` text,
  `Surface Carrez du 5eme lot` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
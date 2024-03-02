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
        date_mutation   Date NOT NULL
	,CONSTRAINT mutation_PK PRIMARY KEY (ID_mutation)
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
# Table: muter
#------------------------------------------------------------

CREATE TABLE muter(
        ID_propriete Int NOT NULL ,
        ID_mutation  Int NOT NULL
	,CONSTRAINT muter_PK PRIMARY KEY (ID_propriete,ID_mutation)

	,CONSTRAINT muter_propriete_FK FOREIGN KEY (ID_propriete) REFERENCES propriete(ID_propriete)
	,CONSTRAINT muter_mutation0_FK FOREIGN KEY (ID_mutation) REFERENCES mutation(ID_mutation)
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

CREATE TABLE `finalcsv2` (
  `Date mutation` datetime DEFAULT NULL,
  `Nature mutation` text,
  `Valeur fonciere` int DEFAULT NULL,
  `No voie` double DEFAULT NULL,
  `B/T/Q` text,
  `Type de voie` text,
  `Voie` text,
  `Code postal` double DEFAULT NULL,
  `Commune` text,
  `Surface reelle bati` double DEFAULT NULL,
  `Nombre pieces principales` double DEFAULT NULL,
  `Surface terrain` text,
  `1er lot` text,
  `2eme lot` text,
  `3eme lot` text,
  `4eme lot` text,
  `5eme lot` text,
  `Type local` text,
  `Adresse` text,
  `Voie_Complete` text
) ENGINE=InnoDB;



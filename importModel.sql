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
# Table: lot
#------------------------------------------------------------

CREATE TABLE lot(
        ID_lot   Int  Auto_increment  NOT NULL ,
        type_lot Varchar (50) NOT NULL
	,CONSTRAINT lot_PK PRIMARY KEY (ID_lot)
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
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: adresse
#------------------------------------------------------------

CREATE TABLE adresse(
        ID_adresse      Int  Auto_increment  NOT NULL ,
        ID_ville        Varchar (50) NOT NULL ,
        numero_voie     Varchar (50) NOT NULL ,
        type_voie       Varchar (50) NOT NULL ,
        voie            Varchar (50) NOT NULL ,
        btq             Varchar (50) NOT NULL ,
        ID_propriete    Int NOT NULL ,
        ID_ville_situe2 Int NOT NULL
	,CONSTRAINT adresse_PK PRIMARY KEY (ID_adresse)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: muter
#------------------------------------------------------------

CREATE TABLE muter(
        ID_propriete Int NOT NULL ,
        ID_mutation  Int NOT NULL
	,CONSTRAINT muter_PK PRIMARY KEY (ID_propriete,ID_mutation)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: apparait
#------------------------------------------------------------

CREATE TABLE apparait(
        ID_lot       Int NOT NULL ,
        ID_propriete Int NOT NULL
	,CONSTRAINT apparait_PK PRIMARY KEY (ID_lot,ID_propriete)
)ENGINE=InnoDB;




ALTER TABLE propriete
	ADD CONSTRAINT propriete_adresse0_FK
	FOREIGN KEY (ID_adresse)
	REFERENCES adresse(ID_adresse);

ALTER TABLE propriete
	ADD CONSTRAINT propriete_natureculture1_FK
	FOREIGN KEY (ID_natureCulture)
	REFERENCES natureculture(ID_natureCulture);

ALTER TABLE propriete 
	ADD CONSTRAINT propriete_adresse0_AK 
	UNIQUE (ID_adresse);

ALTER TABLE adresse
	ADD CONSTRAINT adresse_propriete0_FK
	FOREIGN KEY (ID_propriete)
	REFERENCES propriete(ID_propriete);

ALTER TABLE adresse
	ADD CONSTRAINT adresse_ville1_FK
	FOREIGN KEY (ID_ville_situe2)
	REFERENCES ville(ID_ville);

ALTER TABLE adresse 
	ADD CONSTRAINT adresse_propriete0_AK 
	UNIQUE (ID_propriete);

ALTER TABLE muter
	ADD CONSTRAINT muter_propriete0_FK
	FOREIGN KEY (ID_propriete)
	REFERENCES propriete(ID_propriete);

ALTER TABLE muter
	ADD CONSTRAINT muter_mutation1_FK
	FOREIGN KEY (ID_mutation)
	REFERENCES mutation(ID_mutation);

ALTER TABLE apparait
	ADD CONSTRAINT apparait_lot0_FK
	FOREIGN KEY (ID_lot)
	REFERENCES lot(ID_lot);

ALTER TABLE apparait
	ADD CONSTRAINT apparait_propriete1_FK
	FOREIGN KEY (ID_propriete)
	REFERENCES propriete(ID_propriete);

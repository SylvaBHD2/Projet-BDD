#TO add indexes to the temp table
ALTER TABLE finalcsv
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

select * from finalcsv;

#to addinto mutation table
INSERT INTO mutation (nature_mutation, date_mutation)
SELECT `Nature mutation` AS nature_mutation, `Date mutation` AS date_mutation
FROM finalcsv;

select * from mutation;

#tyo add into ville table
INSERT INTO ville (nom_ville, code_postal)
SELECT DISTINCT commune, `Code postal`
FROM finalcsv;

select * from ville;

#tyo add into adresse table
INSERT INTO adresse (numero_voie,voie,ID_ville)
SELECT ta.Adresse, ta.Voie_Complete,V.ID_ville
FROM finalcsv ta
INNER JOIN ville v ON ta.Commune= v.nom_ville;

Select * from adresse;

#tyo add into natureculture table
INSERT INTO natureculture (`type`)
SELECT DISTINCT `nature culture`
FROM finalcsv;

#tyo add into propriete table
#depreciated do not use
INSERT INTO propriete (valeur_fonciere,type_local,surface_reelle,nbr_piece,surface_terrain,ID_adresse,ID_natureCulture)
SELECT ta.`Valeur fonciere`, ta.`Type local`,ta.`Surface reelle bati`,ta.`Nombre pieces principales`,ta.`Surface terrain`,A.ID_adresse,NULL
FROM finalcsv ta
INNER JOIN Adresse A ON (ta.Voie_Complete = A.voie AND ta.Adresse= A.numero_voie);

# amélioré sans doublons
INSERT INTO propriete (valeur_fonciere,type_local,surface_reelle,nbr_piece,surface_terrain,ID_adresse,ID_natureCulture)
SELECT  DISTINCT ta.`Valeur fonciere`, ta.`Type local`,ta.`Surface reelle bati`,ta.`Nombre pieces principales`,ta.`Surface terrain`,A.ID_adresse,NULL
FROM finalcsv ta
INNER JOIN Adresse A ON (ta.Voie_Complete = A.voie AND ta.Adresse= A.numero_voie);






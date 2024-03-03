#TO add indexes to the temp table
ALTER TABLE finalcsv
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

select * from finalcsv;

#tyo add into ville table
INSERT INTO ville (nom_ville, code_postal)
SELECT DISTINCT commune, `Code postal`
FROM finalcsv;

select * from ville;

INSERT INTO adresse (numero_voie, voie, ID_ville)
SELECT DISTINCT ta.Adresse, ta.Voie_Complete, v.ID_ville
FROM finalcsv ta
INNER JOIN ville v ON ta.Commune = v.nom_ville;

Select * from adresse;

#tyo add into natureculture table
INSERT INTO natureculture (`type`)
SELECT DISTINCT `nature culture`
FROM finalcsv;

select * from natureculture;

#tyo add into propriete table
INSERT INTO propriete (valeur_fonciere, type_local, surface_reelle, nbr_piece, surface_terrain, ID_adresse, ID_natureCulture)
SELECT DISTINCT
    `Valeur fonciere`,
    `Type local`,
    `Surface reelle bati`,
    `Nombre pieces principales`,
    `Surface terrain`,
    ad.ID_adresse,
    nc.ID_natureCulture
FROM
    finalcsv f
    JOIN adresse ad ON f.adresse = ad.numero_voie AND f.voie_complete = ad.voie
    left JOIN natureculture nc ON f.`Nature culture` = nc.`type`;
    
    
Select * from propriete;

#tyo add into lot table
INSERT INTO lot (type_lot, surface_carre_lot)
SELECT `1er lot` AS type_lot, CAST(`Surface Carrez du 1er lot` AS FLOAT) AS surface_carre_lot
FROM finalcsv
WHERE (`1er lot` IS NOT NULL AND `1er lot` <> '') OR (`1er lot` IS NULL AND `Surface Carrez du 1er lot` IS NULL);

INSERT INTO lot (type_lot, surface_carre_lot)
SELECT `2eme lot` AS type_lot, CAST(`Surface Carrez du 2eme lot` AS FLOAT) AS surface_carre_lot
FROM finalcsv
WHERE (`2eme lot` IS NOT NULL AND `2eme lot` <> '') OR (`2eme lot` IS NULL AND `Surface Carrez du 2eme lot` IS NULL);

INSERT INTO lot (type_lot, surface_carre_lot)
SELECT `3eme lot` AS type_lot, CAST(`Surface Carrez du 3eme lot` AS FLOAT) AS surface_carre_lot
FROM finalcsv
WHERE (`3eme lot` IS NOT NULL AND `3eme lot` <> '') OR (`3eme lot` IS NULL AND `Surface Carrez du 3eme lot` IS NULL);

INSERT INTO lot (type_lot, surface_carre_lot)
SELECT `4eme lot` AS type_lot, CAST(`Surface Carrez du 4eme lot` AS FLOAT) AS surface_carre_lot
FROM finalcsv
WHERE (`4eme lot` IS NOT NULL AND `4eme lot` <> '') OR (`4eme lot` IS NULL AND `Surface Carrez du 4eme lot` IS NULL);

INSERT INTO lot (type_lot, surface_carre_lot)
SELECT `5eme lot` AS type_lot, CAST(`Surface Carrez du 5eme lot` AS FLOAT) AS surface_carre_lot
FROM finalcsv
WHERE (`5eme lot` IS NOT NULL AND `5eme lot` <> '') OR (`5eme lot` IS NULL AND `Surface Carrez du 5eme lot` IS NULL);

Select * from lot;

#table mutation
INSERT INTO mutation (nature_mutation, date_mutation, ID_propriete)
SELECT fc.`Nature mutation`, fc.`Date mutation`, p.ID_propriete
FROM finalcsv fc
JOIN adresse a ON fc.Adresse = a.numero_voie
               AND fc.Voie_Complete = a.voie
LEFT JOIN propriete p ON a.ID_adresse = p.ID_adresse
                     AND fc.`Type local` = p.type_local
                     AND fc.`Surface reelle bati` = p.surface_reelle
                     AND fc.`Nombre pieces principales` = p.nbr_piece
                     AND fc.`Surface terrain` = p.surface_terrain
ORDER BY fc.ID;

select * from mutation;

#table apparait
INSERT INTO apparait (ID_lot, ID_propriete)
SELECT l.ID_lot,p.ID_propriete
FROM finalcsv fc
JOIN lot l ON fc.`1er lot` = l.type_lot or FC.`2eme lot` = l.type_lot
JOIN adresse a ON fc.`Voie_Complete` = a.voie
              AND fc.`Adresse` = a.numero_voie
LEFT JOIN propriete p ON a.ID_adresse = p.ID_adresse
				AND fc.`Surface reelle bati` = p.surface_reelle
               AND fc.`Nombre pieces principales` = p.nbr_piece
               AND fc.`Surface terrain` = p.surface_terrain;
               


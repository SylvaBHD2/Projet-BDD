SELECT nom_cinema,count(distinct id_film) as nb_film FROM seance group by nom_cinema

-- double négation
-- Exercice 5 (Division)
-- 1. Le nom des cinémas qui passent tous les films de Kubrick


select nom_cinema from seance natural join film where nom_realisateur='Kubrick'
group by nom_cinema having count(distinct id_film) = (select count(*) from film where nom_realisateur='Kubrick');

select distinct nom_cinema from seance AS S1
where not exists (
    select * from film f1 where Nom_Realisateur='Kubrick' and not exists (
        select * from seance AS S2 where s1.nom_cinema = s2.nom_cinema and f1.id_film = s1.id_film
        )
    );
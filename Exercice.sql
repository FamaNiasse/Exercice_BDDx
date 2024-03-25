--1. Liste des potions : Numéro, libellé, formule et constituant principal. (5 lignes)
select potion 
from potion;

--2. Liste des noms des trophées rapportant 3 points. (2 lignes)
select nom_categ 
from categorie 
where nb_points = 3;

--3. Liste des villages (noms) contenant plus de 35 huttes. (4 lignes)
select nom_village 
from village 
where nb_huttes > 35;

--4. Liste des trophées (numéros) pris en mai / juin 52. (4 lignes)
select num_trophee 
from trophee 
where extract (month from date_prise) 
in (5, 6) 
and extract (year from  date_prise) = 2052;

--5. Noms des habitants commençant par 'a' et contenant la lettre 'r'. (3 lignes)
select nom 
from habitant 
where nom 
like '%r%' 
and nom 
like 'A%';

--6. Numéros des habitants ayant bu les potions numéros 1, 3 ou 4. (8 lignes)
select distinct num_hab 
 absorber 
where quantite 
in (1, 3, 4);

--7. Liste des trophées : numéro, date de prise, nom de la catégorie et nom du preneur. (10lignes)
select num_trophee, date_prise, code_cat, num_preneur 
from trophee;

--8. Nom des habitants qui habitent à Aquilona. (7 lignes)
select nom 
from habitant 
where num_village = 1;

--9. Nom des habitants ayant pris des trophées de catégorie Bouclier de Légat. (2 lignes)
select nom 
from habitant h 
join trophee t 
on h.num_hab = t.num_preneur  
where t.code_cat = 'BLT';

--10. Liste des potions (libellés) fabriquées par Panoramix : libellé, formule et constituantprincipal. (3 lignes)
select lib_potion 
from potion p 
join fabriquer f 
on p.num_potion = f.num_potion 
where num_hab = 4;

--11. Liste des potions (libellés) absorbées par Homéopatix. (2 lignes)
select distinct lib_potion  
from potion p 
join absorber a 
on p.num_potion = a.num_potion 
where a.num_hab =10;

--12. Liste des habitants (noms) ayant absorbé une potion fabriquée par l'habitant numéro 3. (4 lignes)
select distinct nom 
from habitant h 
join absorber a 
on h.num_hab = a.num_hab
join fabriquer f 
on f.num_potion = a.num_potion 
where f.num_hab =3;

--13. Liste des habitants (noms) ayant absorbé une potion fabriquée par Amnésix. (7 lignes)
select distinct nom 
from habitant h 
join absorber a 
on h.num_hab = a.num_hab 
join fabriquer f 
on a.num_potion = f.num_potion 
where f.num_hab = 2;


--14. Nom des habitants dont la qualité n'est pas renseignée. (2 lignes)
select nom from habitant h where num_qualite is null;

--15. Nom des habitants ayant consommé la Potion magique n°1 (c'est le libellé de lapotion) en février 52. (3 lignes)
select nom, a.date_a 
from habitant h 
join absorber a ON h.num_hab = a.num_hab
join potion p ON a.num_potion = p.num_potion 
where p.lib_potion = 'Potion magique n°1'
and extract(month from a.date_a) = 2
and (year from a.date_a) = 2052;



--16. Nom et âge des habitants par ordre alphabétique. (22 lignes)
select nom, age 
from habitant h
order by nom;

--17. Liste des resserres classées de la plus grande à la plus petite : nom de resserre et nom du village. (3 lignes)
select nom_resserre, superficie 
from resserre 
order by superficie desc;

--***

--18. Nombre d'habitants du village numéro 5. (4)
select num_hab
from habitant
where num_village = 5;



--19. Nombre de points gagnés par Goudurix. (5)
select sum(nb_points)  as total
from categorie c
join trophee t 
on c.code_cat = t.code_cat 
join habitant h 
on t.num_preneur = h.num_hab 
where h.nom = 'Goudurix';




--20. Date de première prise de trophée. (03/04/52)
select min (date_prise) as date de prise 
from trophee t;


--21. Nombre de louches de Potion magique n°2 (c'est le libellé de la potion) absorbées. (19)
select sum(quantite) as total
from absorber a
join potion p 
on a.num_potion = p.num_potion 
where p.lib_potion = 'Potion magique n°2';

--22. Superficie la plus grande. (895)
select max(superficie) as maximum 
from resserre;

--23. Nombre d'habitants par village (nom du village, nombre). (7 lignes)
select distinct nom_village, nb_huttes 
from village v 
join habitant h 
on h.num_village = v.num_village 
where v.nb_huttes is not null;

--24. Nombre de trophées par habitant (6 lignes)
select h.num_hab, count(t.num_preneur) as total_trophee
from habitant h
join trophee t 
on h.num_hab = t.num_preneur 
group by h.num_hab;


--25. Moyenne d'âge des habitants par province (nom de province, calcul). (3 lignes)
select p.nom_province, avg(h.age) as age_moyen
from province p 
join village v 
on p.num_province = v.num_province 
join habitant h 
on v.num_village = h.num_village 
group by p.num_province;

--26. Nombre de potions différentes absorbées par chaque habitant (nom et nombre). (9lignes)
select h.nom,  count(a.quantite) as potion_total
from habitant h
join absorber a 
on h.num_hab = a.num_hab
join potion p 
on p.num_potion = a.num_potion 
group by h.nom;

--27. Nom des habitants ayant bu plus de 2 louches de potion zen. (1 ligne)
select distinct h.nom
from habitant h
join absorber a 
on h.num_hab = a.num_hab 
join potion p 
on a.num_potion = p.num_potion 
where p.lib_potion = 'Potion Zen'
and a.quantite > 2 ;
group by h.nom 


--***
--28. Noms des villages dans lesquels on trouve une resserre (3 lignes)
select nom_village 
from village v
join habitant h 
on v.num_village = h.num_village 
join resserre r 
on v.num_village = r.num_village 
where r.num_village is not null  
group by v.nom_village;

--29. Nom du village contenant le plus grand nombre de huttes. (Gergovie)
select nom_village
from village 
where nb_huttes = (select max(nb_huttes) from village );


--30. Noms des habitants ayant pris plus de trophées qu'Obélix (3 lignes).
select h.nom 
from habitant h
join trophee t on h.num_hab = t.num_preneur 
group by h.nom
having count(t.num_trophee) > (
    select count(*)
    from trophee
    where num_preneur = (select num_hab from habitant where nom = 'Obélix')
);




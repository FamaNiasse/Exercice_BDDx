--1. Liste des potions : Numéro, libellé, formule et constituant principal. (5 lignes)
select all potion from potion;

--2. Liste des noms des trophées rapportant 3 points. (2 lignes)
select all trophee from trophee where num_resserre = 3;

--3. Liste des villages (noms) contenant plus de 35 huttes. (4 lignes)
select all village from village where nb_huttes > 35;

--4. Liste des trophées (numéros) pris en mai / juin 52. (4 lignes)
select trophee FROM trophee WHERE EXTRACT(MONTH FROM date_prise) IN (5, 6) AND EXTRACT(YEAR FROM date_prise) = 2052;

--5. Noms des habitants commençant par 'a' et contenant la lettre 'r'. (3 lignes)
select nom from habitant where nom like '%r%' and nom like 'A%';

--6. Numéros des habitants ayant bu les potions numéros 1, 3 ou 4. (8 lignes)
select distinct num_hab from absorber where quantite in (1, 3, 4);

--7. Liste des trophées : numéro, date de prise, nom de la catégorie et nom du preneur. (10lignes)

--8. Nom des habitants qui habitent à Aquilona. (7 lignes)
select nom from habitant where num_village = 1;

--9. Nom des habitants ayant pris des trophées de catégorie Bouclier de Légat. (2 lignes)
SELECT c.nom_categ , t.num_preneur , h.nom FROM categorie c JOIN trophee t ON t.code_cat = c.code_cat  JOIN habitant h ON h.num_hab = t.num_preneur WHERE c.nom_categ  = 'Bouclier de Légat';

--10. Liste des potions (libellés) fabriquées par Panoramix : libellé, formule et constituantprincipal. (3 lignes)
select p.lib_potion, p.formule , p.constituant_principal , h.nom from potion p join fabriquer f on f.num_potion  = p.num_potion join habitant h on h.num_hab = f.num_hab where h.nom = 'Panoramix';

--11. Liste des potions (libellés) absorbées par Homéopatix. (2 lignes)
select p.lib_potion, h.nom
from potion p 
join absorber a 
on p.num_potion = a.num_potion 
join habitant h 
on h.num_hab = a.num_hab 
where h.nom ='Homéopatix';

--12. Liste des habitants (noms) ayant absorbé une potion fabriquée par l'habitant numéro 3. (4 lignes)
select  h.nom
from habitant h 
join absorber a 
on h.num_hab = a.num_hab 
join potion p 
on a.num_potion = p.num_potion 
join fabriquer f 
on f.num_hab = h.num_hab
where h.num_hab = 3;

--13. Liste des habitants (noms) ayant absorbé une potion fabriquée par Amnésix. (7 lignes)

--14. Nom des habitants dont la qualité n'est pas renseignée. (2 lignes)

--15. Nom des habitants ayant consommé la Potion magique n°1 (c'est le libellé de lapotion) en février 52. (3 lignes)

--16. Nom et âge des habitants par ordre alphabétique. (22 lignes)

--17. Liste des resserres classées de la plus grande à la plus petite : nom de resserre et nom du village. (3 lignes)

--***

--18. Nombre d'habitants du village numéro 5. (4)

--19. Nombre de points gagnés par Goudurix. (5)

--20. Date de première prise de trophée. (03/04/52)

--21. Nombre de louches de Potion magique n°2 (c'est le libellé de la potion) absorbées. (19)

--22. Superficie la plus grande. (895)

--***

--23. Nombre d'habitants par village (nom du village, nombre). (7 lignes)

--24. Nombre de trophées par habitant (6 lignes)

--25. Moyenne d'âge des habitants par province (nom de province, calcul). (3 lignes)

--26. Nombre de potions différentes absorbées par chaque habitant (nom et nombre). (9lignes)


--27. Nom des habitants ayant bu plus de 2 louches de potion zen. (1 ligne)


--***
--28. Noms des villages dans lesquels on trouve une resserre (3 lignes)

--29. Nom du village contenant le plus grand nombre de huttes. (Gergovie)

--30. Noms des habitants ayant pris plus de trophées qu'Obélix (3 lignes).

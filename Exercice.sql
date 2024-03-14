--1. Liste des potions : Numéro, libellé, formule et constituant principal. (5 lignes)
select all potion from potion;

--2. Liste des noms des trophées rapportant 3 points. (2 lignes)
select all trophee from trophee where num_trophee = 3;

--3. Liste des villages (noms) contenant plus de 35 huttes. (4 lignes)
select all village from village where nb_huttes > 35;

--4. Liste des trophées (numéros) pris en mai / juin 52. (4 lignes)
select trophee FROM trophee WHERE EXTRACT(MONTH FROM date_prise) IN (5, 6) AND EXTRACT(YEAR FROM date_prise) = 2052;
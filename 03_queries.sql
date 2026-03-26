-- Requête 1 : Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- Résultat attendu : Une liste avec les noms de toutes les focaccias rangés par ordre alphabétique croissant, sans les id et prix
-- Code :
    SELECT nom 
    FROM focaccia 
    ORDER BY nom ASC;
-- Résultat obtenu : Liste alphabétique des noms des focaccias débutant par Américaine et se terminant par Tradizione

-- Requête 2 : Afficher le nombre total d'ingrédients
-- Résultat attendu : Uniquement le nombre total d'ingrédients, sans id ou nom
-- Code :
    SELECT COUNT(*)
    AS NumIngredient
    FROM ingredient;
-- Résultat obtenu : Le chiffre 25 sous la colonne "NumIngredient" comme demandé

-- Requête 3 : Afficher le prix moyen des focaccias
-- Résultat attendu : Le résultat du calcul mathématique du prix moyen des focaccias
-- Code :
    SELECT AVG(prix)
    AS AveragePrice
    FROM focaccia;
-- Résultat obtenu : Le nombre 10.375000 dans la colonne AveragePrice

-- Requête 4 : Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- Résultat attendu : La liste alphabétique des boissons avec 2 colonnes pour leur nom et la marque associée, sans id
-- Code :
    SELECT boisson.nom, marque.nom AS nom_marque
    FROM boisson 
    INNER JOIN marque ON boisson.id_marque = marque.id_marque
    ORDER BY boisson.nom ASC;
-- Résultat obtenu : Une liste des boissons et de leurs marques associées

-- Requête 5 : Afficher la liste des ingrédients pour une Raclaccia
-- Résultat attendu : La liste des ingrédients de la Raclaccia avec leurs noms
-- Code :
    SELECT ingredient.nom
    FROM ingredient
    JOIN comprend ON ingredient.id_ingredient = comprend.id_ingredient
    JOIN focaccia ON focaccia.id_focaccia = comprend.id_focaccia
    WHERE focaccia.nom = 'Raclaccia'
    ORDER BY ingredient.nom ASC;
-- Résultat obtenu : La liste des noms des ingrédients compris dans la Raclaccia
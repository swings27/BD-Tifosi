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
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
    SELECT ROUND(AVG(prix), 2)
    AS AveragePrice
    FROM focaccia;
-- Résultat obtenu : Le nombre arrondi 10.38 dans la colonne AveragePrice

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

-- Requête 6 : Afficher le nom et le nombre d'ingrédients pour chaque foccacia
-- Résultat attendu : 2 colonnes, l'un avec le nom de la focaccia et l'autre avec le nombre d'ingrédients correspondant
-- Code :
    SELECT focaccia.nom, COUNT(comprend.id_ingredient) AS nb_ingredient
    FROM focaccia
    JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
    GROUP BY focaccia.nom;
-- Résultat obtenu : 2 colonnes avec le nom de chaque focaccia par ordre alphabétique et le nombre d'ingrédients lui correspondant

-- Requête 7 : Afficher le nom de la focaccia qui a le plus d'ingrédients
-- Résultat attendu : Uniquement le nom de la focaccia avec le plus d'ingrédients, sans préciser le nombre
-- Code :
    SELECT focaccia.nom
    FROM focaccia
    JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
    GROUP BY focaccia.nom
    ORDER BY COUNT(comprend.id_ingredient) 
    DESC LIMIT 1;
-- Résultat obtenu : Le nom de la focaccia "Paysanne" qui compte le plus d'ingrédients sans afficher le nombre

-- Requête 8 : Afficher la liste des focaccia qui contiennent de l'ail
-- Résultat attendu : Une liste en colonne unique des focaccias avec de l'ail
-- Code :
    SELECT focaccia.nom
    FROM focaccia
    JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
    JOIN ingredient ON ingredient.id_ingredient = comprend.id_ingredient
    WHERE ingredient.nom = 'Ail'
    ORDER BY focaccia.nom ASC;
-- Résultat obtenu : La liste alphabétique des focaccias contenant de l'ail (Mozaccia, Gorgonzollaccia, Raclaccia et Paysanne)

-- Requête 9 : Afficher la liste des ingrédients inutilisés
-- Résultat attendu : La liste des ingredients n'apparaissant dans aucune focaccia
-- Code :
    SELECT ingredient.nom
    FROM ingredient
    LEFT JOIN comprend ON ingredient.id_ingredient = comprend.id_ingredient
    WHERE comprend.id_ingredient IS NULL;
-- Résultat obtenu : La liste de 2 ingrédients (Salami et Tomate cerise)

-- Requête 10 : Afficher la liste des focaccia qui n'ont pas de champignons
-- Résultat attendu : La liste des focaccias ne contenant pas de champignons
-- Code :
    SELECT focaccia.nom
    FROM focaccia
    WHERE focaccia.id_focaccia NOT IN (
        SELECT focaccia.id_focaccia
        FROM focaccia
        JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
        JOIN ingredient ON ingredient.id_ingredient = comprend.id_ingredient
        WHERE ingredient.id_ingredient = 7
    );
-- Résultat obtenu : La liste des 2 pizzas ne comprenant pas de champignons (Américaine et Hawaienne)
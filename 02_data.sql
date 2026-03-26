-- Insertion données marque
INSERT INTO marque (nom) VALUES ('Coca-Cola');
INSERT INTO marque (nom) VALUES ('Cristalline');
INSERT INTO marque (nom) VALUES ('Monster');
INSERT INTO marque (nom) VALUES ('Pepsico');

-- Insertion données boissons
INSERT INTO boisson (nom, id_marque) VALUES
    ('Coca-Cola Zéro', 1),
    ('Coca-Cola Original', 1),
    ('Fanta Citron', 1),
    ('Fanta Orange', 1),
    ('Capri-Sun', 1),
    ('Pepsi', 4),
    ('Pepsi Max Zéro', 4),
    ('Lipton Zéro Citron', 4),
    ('Lipton Peach', 4),
    ('Monster Energy Ultra Gold', 3),
    ('Monster Energy Ultra Blue', 3),
    ('Eau de source', 2);

-- Insertion données ingrédient
INSERT INTO ingredient (nom) VALUES 
    ('Ail'), 
    ('Ananas'), 
    ('Artichaut'), 
    ('Bacon'), 
    ('Base Tomate'), 
    ('Base Crème'),
    ('Champignon'), 
    ('Chèvre'), 
    ('Cresson'), 
    ('Emmental'), 
    ('Gorgonzola'), 
    ('Jambon cuit'),
    ('Jambon fumé'),
    ('Oeuf'),
    ('Oignon'),
    ('Olive noire'),
    ('Olive verte'),
    ('Parmesan'),
    ('Piment'),
    ('Poivre'),
    ('Pomme de terre'),
    ('Raclette'),
    ('Salami'),
    ('Tomate cerise'),
    ('Mozarella');

-- Insertion données focaccia
INSERT INTO focaccia (nom, prix) VALUES
    ('Mozaccia', 9.80),
    ('Gorgonzollaccia', 10.80),
    ('Raclaccia', 8.90),
    ('Emmentalaccia', 9.80),
    ('Tradizione', 8.90),
    ('Hawaienne', 11.20),
    ('Américaine', 10.80),
    ('Paysanne', 12.80);

-- INSERTION JOINTURE "comprend" (ingredient - focaccia)

-- Focaccia Mozaccia
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
    (1, 5, 200), (1, 25, 50), (1, 9, 20), (1, 13, 80), (1, 1, 2), (1, 3, 20), (1, 7, 40), (1, 18, 50), (1, 20, 1), (1, 16, 20);

-- Focaccia Gorgonzollaccia
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
    (2, 5, 200), (2, 11, 50), (2, 9, 20), (2, 1, 2), (2, 7, 40), (2, 18, 50), (2, 20, 1), (2, 16, 20);

-- Focaccia Raclaccia
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
    (3, 5, 200), (3, 22, 50), (3, 9, 20),(3, 1, 2), (3, 7, 40), (3, 18, 50), (3, 20, 1);

-- Focaccia Emmentalaccia
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
    (4, 6, 200), (4, 10, 50), (4, 9, 20), (4, 7, 40), (4, 18, 50), (4, 20, 1), (4, 15, 20);

-- Focaccia Tradizione
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
    (5, 5, 200), (5, 25, 50), (5, 9, 20), (5, 12, 80), (5, 7, 80), (5, 18, 50), (5, 20, 1), (5, 16, 10), (5, 17, 10);

-- Focaccia Hawaienne
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
    (6, 5, 200), (6, 25, 50), (6, 9, 20), (6, 4, 80), (6, 2, 40), (6, 19, 2), (6, 18, 50), (6, 20, 1), (6, 16, 20);

-- Focaccia Américaine
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
    (7, 5, 200), (7, 25, 50), (7, 9, 20), (7, 4, 80), (7, 21, 40), (7, 18, 50), (7, 20, 1), (7, 16, 20);

-- Focaccia Paysanne
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Base Crème'), 200),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Chèvre'), 50),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson'), 20),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Pomme de terre'), 80),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Jambon fumé'), 80),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Ail'), 2),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Artichaut'), 20),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon'), 40),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan'), 50),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre'), 1),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Olive noire'), 20),

    ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne'),
     (SELECT id_ingredient FROM ingredient WHERE nom = 'Oeuf'), 50);
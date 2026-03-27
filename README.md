# Tifosi - bas de données MySQL
Base de données d'un restaurant italien de focaccias, conçue dans le cadre d'une formation développeuse fullstack par le CEF.
Elle gère les focaccias, ingrédients, boissons, marques, menus et clients.

## Structure de la base de données
La base 'tifosi' contient 10 tables :

### Tables principales :
| Table | Description |
|---|---|
| `focaccia` | Les focaccias du menu avec leur prix |
| `ingredient` | Les ingrédients disponibles |
| `boisson` | Les boissons avec leur marque associée |
| `marque` | Les marques des boissons |
| `menu` | Les menus proposés |
| `client` | Les clients du restaurant |

### Tables de jointure
| Table | Relie |
|---|---|
| `comprend` | focaccia ↔ ingredient (avec quantité) |
| `constitue` | menu ↔ focaccia |
| `contient` | menu ↔ boisson |
| `achete` | client ↔ menu (avec date d'achat) |

## Prérequis
- XAMPP avec le module MySQL activé ou MySQL Server
- MySQL Workbench ou phpMyAdmin
- Un éditeur de code (VS Code utilisé ici)

## Installation

### 1. Cloner le dépôt
```
https://github.com/swings27/BD-Tifosi.git
```

### 2. Lancer MySQL
Ouvre XAMPP et "start" le module MySQL..

### 3. Créer l'utilisateur et la base
Ouvre MySQL Workbench, clique sur ta connection locale et exécute dans cet ordre :

**Étape 1 — Créer le schéma**
```
source 01_schema.sql
```

**Étape 2 — Insérer les données**
```
source 02_data.sql
```

**Étape 3 — Exécuter les requêtes de test**
```
source 03_queries.sql
```

> *** Respectez l'ordre d'exécution — chaque script dépend du précédent. ***

## Structure du projet

BD-TIFOSI
→ 01_schema.sql      # Création de la base et des tables
→ 02_data.sql        # Insertion des données de test
→ 03_queries.sql     # Les 10 requêtes de vérification
→ README.md          # Documentation du projet

## Requêtes de vérification

Le fichier `03_queries.sql` contient 10 requêtes de test :

1. Liste des focaccias par ordre alphabétique
2. Nombre total d'ingrédients
3. Prix moyen des focaccias
4. Liste des boissons avec leur marque
5. Ingrédients de la Raclaccia
6. Nombre d'ingrédients par focaccia
7. Focaccia avec le plus d'ingrédients
8. Focaccias contenant de l'ail
9. Ingrédients inutilisés
10. Focaccias sans champignons

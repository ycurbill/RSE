# RSE mini-app

## Project Setup

This project was built using these versions:
- Node 20.7.0
- NPM 10.1.0
- Ruby 3.2.2
- Rails 7.1.0
- Vue 3.3.4
- sqlite3 3.39.5

I recommend having at least these versions or later.

1. Clone this repo
2. Open your favorite IDE with 2 terminals
3. In the first one, cd into frontend folder
```sh
cd path/to/project/frontend
```
4. 
```sh
npm install
```
5.
```sh
npm run dev
``` 
6. Open a browser and go to the address that just appeared after running the previous command.

7. In the second terminal, cd into backend folder
```sh
cd path/to/project/backend
```
8.
```sh
bundle install
```
9. 
```sh
rails db:migrate
```

(Optional: To empty database)
```sh
rails db:seed
```

9. 
```sh
rails server -p 3000
```
(If port 3000 is already in use, close the process where it is in use and run again this command)

## Choix effectués
Frontend
- Utilisation de la librairie Vuetify afin d'aller plus vite.
- Utilisation de Grid afin de rendre l'application responsive.

Backend
- SQLite pour le backend car c'était le plus simple
    - UNE action peut avoir PLUSIEURS indicateurs, mais chaque indicateur n'a qu'une seule action (Car il y a la valeur associée de l'indicateur).
    - Une table à part pour enregistrer les indicateurs que le responsable de magasin doit remplir.
    
Architecture
- Un dossier back qui sert d'API. Un dossier frontend qui fait des requests à l'API.
- Une view pour chaque page. 
- Component Action pour les actions. 
- Component DeclarationsList pour afficher la liste de toutes les actions réalisées par le magasin (Et l'ajout de nouveaux indicateurs)
- Deux components différentes pour les deux Popup car elle diffèrent pas mal.


## Voies d'amélioration
1) Le design 
    - Layout: Améliorer le responsive notament pour les écrans moyens et grands (les inputs prennent toutes la largeur)
    - Couleurs
    - Bouton "voir les indicateurs" qui a l'air coupé en bas
    - Ajout d'une image pour l'action

2) Fonctionnalités
    - Possibilité d'enlever un indicateur pour le responsable RSE
    - Rendre les inputs obligatoires
    - Ajouter une date de fin à l'action
    - Adobe puisse avoir plusieurs établissements
    - D'autres types d'actions
    - Gestion de différents types de données pour les indicateurs
    - Pagination pour la liste des actions.
    - Filtre pour la liste des actions.

3) Le code
    - Plus de petits commit
    - Davantage de commentaires
    - Gestion d'erreur
    - Sécurité (ex: script dans les inputs)
    - Davantage découpé le front en components.
    - Améliorer la gestion des nouveaux indicateurs (code assez complexe dans PopupAction.vue)

---


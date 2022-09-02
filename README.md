# [prairify.me](https://prairify.me)

<!-- ![Image](https://prairify.me/public/images/midsummer-prairie.png) -->

## In a nutshell, the app would help a person or company turn a lawn into a patch of prairie

It is inspired by the [r/NoLawns](https://www.reddit.com/r/NoLawns/top/?t=all) subreddit:

> Discussions and advice for anyone looking for an alternative to the boring grassy lawn. With an emphasis on **native planting**, conservation and **pollination**. No Lawns is a way to utilise yard space other than traditional grass lawn such as flowers, fruits and veggies, herbs, and paths.
> No Lawns is a place where we encourage multi-species lawns and moving away from a monoculture lawn.

## 1. Présentation

> Présente en un ou deux paragraphes ton application. Commence par le besoin : à quel besoin réponds-tu ?

Le besoin d'aider l'environnement dans une demarche collective et agréable, nous responsabiliser sur l'impact des pelouses sur la nature.

> Puis décris ton application brièvement de manière compréhensible. Si c'est long chiant et ennuyeux, les gens vont s'arrêter à ce paragraphe. Si c'est trop vague, les gens vont penser que tu ne sais pas ce que tu veux. C'est normal d'être dans le brouillard, mais ce n'est pas normal de ne pas pouvoir décrire son application en un paragraphe.

**En un mot, aider un utilisateur a transformer son gazon uniquement décoratif en magnifique petit bout de prairie, avec sa faune de papillons, abeilles , etc.**

## 2. Parcours utilisateur

> Décris le parcours utilisateur de ton application. En terme de produit à quoi elle ressemblera.

- User va ouvrir la page web
- User verra un carousel de photos d'exemples de résultats possibles
- Le site demandera à l'utilisateur de sélectionner une region (post THP)
- User verra une liste de plantes compatibles avec la region

  - Jolies cards avec une ou deux images par plante
  - Le(s) nom(s) de la plante
  - Plus d'informations sur la plante (vertus médicinales, preparations etc)
  - Un système d’icônes ludique qui montre la faune de la plante (e.g. abeille, papillon, coccinelle...)
  - Le prix des graines, potentiellement
  - Une liste basique de ressources DIY

- Invitation a la creation de compte pour acceder a :
  - **La creation d'un projet utilisant les plantes sélectionnées**
    - dashboard
    - photo initiale
    - checklist avec les différentes plantes
  - Une liste de plantes modifiable
  - Les ressources DIY customisables (filtrage, favoris, sauvegardées en BDD)

## 3. Concrètement et techniquement

> Dans cette partie, tu pourras décrire l'aspect technique du projet.

### 3.1. Base de données

> Comment tu vois la base de données de l'application ?

![Diagram](https://prairify.me/public/images/db-diagram.png)
_Sur le diagramme, \* signifie many, 1 signifie 1._

Un User pourra avoir plusieurs projets.

- **Une table Projet (joint presque tout)**
- Une table User
- Une table Region
- Des tables comment et like pour les projets
- Une table plante, par projet aussi, qui a une table insectes

### 3.2. Front

> Quels sont les composants dont vous aurez besoin ? Aurez-vous besoin d'un peu de front dynamique avec JavaScript pour la faire fonctionner ?

On tenterait bien TailwindCSS pour le front, et un peu de JS pour les interactions et l'UI.
Fallback: Bootstrap

### 3.3. Backend

> De quoi avez-vous besoin pour le backend ? Quelles sont les APIs en back que vous allez brancher et utiliser ?

- API de recherche (google ?)
  - Recherche inversée sur la DB des plantes (e.g. Lavande dans quelle region...)
- API de partage de projets (Facebook, twitter, etc) => étudier la faisabilité
- API de géolocalisation => étudier la faisabilité

### 3.4. Mes besoins techniques

Équipe deja constituée, on a des competences bien variées.

## 4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine

> Nous allons vous demander de livrer une version minimaliste mais fonctionnelle à la fin de la première semaine. Décris ce que vous voulez avoir fait à la fin de la première semaine. Pense minimaliste, fonctionnel, efficace. Comment avec le moins de code possible vous arrivez à donner une version fonctionnelle de l'application.

- User avec compte
- Carousel de photos d'exemples de résultats possibles
- Creation de projet
- Une region test (Ile de France? Sud ?)
- Liste de plantes (cards)
- Active Storage pour les photos
- Les insectes par plante (sans icônes au moment de la création)
- Une section avec des cards de ressources DIY

## 5. La version que l'on présentera aux jury

> La deuxième semaine vous allez ajouter des fonctionnalités pour améliorer l'expérience utilisateurs de votre application. Quelles fonctionnalités tu aimerais bien ajouter ?

- Plus d'informations sur la plante (vertus médicinales, preparations etc)
- Un système d’icônes ludique qui montre la faune de la plante (e.g. abeille, papillon, coccinelle...)
- Adaptation de la liste de ressources DIY par projet
- Le prix des graines, potentiellement

- checklist avec les différentes plantes
  - Une liste de plantes modifiable
  - Les ressources DIY customisables (filtrage, favoris, sauvegardées en BDD)

## 6. Notre mentor

Qui est ton mentor ?

"Josselin" Muller

## 7. Options de features si on continue apres THP (post THP) ou en semaine

- CMS (post THP)

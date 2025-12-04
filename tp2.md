---
title: " INF5151 Devoir 2 - Forum de Discussion "
author: |
    George Fam (FAMG76050000) \
	 \
	Cours: INF5151 - Génie Logiciel: Analyse et Modélisation \
	 \
	Professeur : Lounis Hakim \
date: "03 Décembre 2025"
geometry: margin=1in
fontsize: 12pt
header-includes:
  - \usepackage{titling}
  - \usepackage[french]{babel}
  - \usepackage[utf8]{inputenc}
  - \pretitle{\begin{center}\Large\bfseries}
  - \posttitle{\end{center}}
  - \preauthor{\begin{center}}
  - \postauthor{\end{center}}
  - \predate{\begin{center}}
  - \postdate{\end{center}}
---

\pagebreak

## Question 1: Cas d’Utilisation

### Acteurs
- Non-Membre (Visiteur) : Utilisateur non authentifié.
- Membre : Utilisateur authentifié (Hérite de Non-Membre).
- Modérateur : Membre ayant des droits de surveillance (Hérite de Membre).
- Administrateur : Super-utilisateur (Hérite de Modérateur).
- Temps : Acteur système pour les délais.

### UC01 - S’inscrire
- **Acteur :** Non-Membre
- **Description :** Permet à un visiteur de créer un compte pour devenir membre.
- **Scénario :** Le visiteur fournit pseudo, email, mot de passe. Le système valide l'unicité et crée le compte.
- **Exceptions :** Pseudo ou courriel déjà pris, Idéntifiants invalide.

### UC02 - S'authentifier
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Permet au membre de se connecter au système.
- **Scénario :** Saisie login/mdp. Vérification système. Ouverture session.
- **Exceptions :** Identifiants invalides ou Compte Banni.

### UC03 - Consulter les topics
- **Acteur :** Non-Membre (et par héritage : Membre, Modérateur, Administrateur)
- **Description :** Accéder à la lecture des fils de discussion.
- **Scénario :** L'utilisateur navigue dans les dossiers, sélectionne un topic et lit les posts.

### UC04 - Rechercher
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Trouver du contenu spécifique dans le forum.
- **Scénario :** Saisie de mots-clés et/ou filtre par auteur. Le système affiche les résultats correspondants.

### UC05 - Gérer son profil
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Modifier ses informations personnelles (avatar, signature, mot de passe).
- **Scénario :** Le membre accède à son profil, modifie les champs souhaités et valide.

\pagebreak

### UC06 - Gérer ses messages privés (Abstrait)
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Cas d'utilisation généralisant les interactions avec la messagerie privée.

### UC06.1 - Envoyer un message privé
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Écrire à un autre membre.
- **Scénario :** Le membre choisit un destinataire, rédige le message et l'envoie. Le système notifie le destinataire.

### UC06.2 - Consulter ses messages
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Lire les messages reçus.
- **Scénario :** Le membre ouvre sa boîte de réception, le système liste les messages. Le membre clique pour lire le détail.

### UC06.3 - Nettoyer sa boîte
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Supprimer des messages pour faire de la place.
- **Scénario :** Le membre sélectionne un ou plusieurs messages et demande leur suppression.

### UC07 - Créer un topic
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Initier une nouvelle discussion dans un dossier.
- **Scénario :** Le membre définit le titre et la description. Le système invoque UC08 pour le premier post.

### UC08 - Créer un post (Contribuer)
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Ajouter du contenu textuel (réponse ou nouveau fil).
- **Scénario :** Le membre rédige son texte (optionnel : ajout média) et publie. Le compteur de posts est incrémenté.

### UC09 - Éditer son post
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur), Temps
- **Description :** Modifier un post existant si le délai le permet.
- **Scénario :** Le membre demande l'édition. Le système vérifie si `Temps < 30 min`. Si oui, la modification est enregistrée.
- **Exceptions :** Délai de 30 minutes dépassé.

### UC10 - Gérer le calendrier (Abstrait)
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Cas d'utilisation généralisant les interactions avec l'agenda communautaire.

### UC10.1 - Consulter le calendrier
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Voir les événements à venir.
- **Scénario :** Le système affiche la vue calendaire avec les événements planifiés.

### UC10.2 - Ajouter un événement
- **Acteur :** Membre (et par héritage : Modérateur, Administrateur)
- **Description :** Proposer un nouvel événement.
- **Scénario :** Le membre définit date, titre et description. L'événement est ajouté au calendrier commun.

### UC11 - Modérer le contenu (Abstrait)
- **Acteur :** Modérateur (et par héritage : Administrateur)
- **Description :** Cas d'utilisation généralisant les actions de régulation.

### UC11.1 - Supprimer un post inapproprié
- **Acteur :** Modérateur (et par héritage : Administrateur)
- **Description :** Retirer un contenu qui ne respecte pas la charte.
- **Scénario :** Le modérateur identifie le post et le supprime. Le contenu n'est plus visible.

### UC11.2 - Fermer un topic
- **Acteur :** Modérateur (et par héritage : Administrateur)
- **Description :** Verrouiller une discussion.
- **Scénario :** Le modérateur change l'état du topic à "Fermé". Les nouvelles réponses sont bloquées.

### UC11.3 - Avertir un membre
- **Acteur :** Modérateur (et par héritage : Administrateur)
- **Description :** Rappel à l'ordre formel.
- **Scénario :** Le modérateur envoie un avertissement système à un utilisateur spécifique.

### UC11.4 - Bannir un membre
- **Acteur :** Modérateur (et par héritage : Administrateur)
- **Description :** Suspendre l'accès d'un membre.
- **Scénario :** Le modérateur définit une durée. Le statut du membre passe à "Banni".

### UC12 - Administrer les membres (Abstrait)
- **Acteur :** Administrateur
- **Description :** Cas d'utilisation généralisant la gestion des comptes.

### UC12.1 - Créer un compte spécial
- **Acteur :** Administrateur
- **Description :** Création manuelle de comptes (e.g. administrateurs et modérateurs).
- **Scénario :** L'admin saisit les infos du compte et force sa création sans validation par email.

### UC12.2 - Supprimer un compte
- **Acteur :** Administrateur
- **Description :** Retrait définitif d'un utilisateur.
- **Scénario :** L'admin sélectionne un membre et supprime son compte et ses données personnelles.

\pagebreak

## Question 1B: Diagramme des Use-Cases (incl. relations entre cas)

::: center
![](diagramme.png){ width=110% }
:::

\pagebreak

## Question 2: Modèle de Classes
Les concepts essentiels du domaine identifiés à partir des cas d’utilisation sont :

| Concept | Description |
|----------|--------------|
| **Forum** | Entité racine représentant le système de discussion dans sa globalité. |
| **Dossier** | Catégorie thématique (Politique, Sport, Culture...) regroupant des topics. |
| **Topic** | Fil de discussion créé par un membre, composé d'un titre et d'une suite de posts. |
| **Post** | Contribution (message) d'un membre au sein d'un topic. |
| **Membre** | Utilisateur inscrit et authentifié pouvant participer, créer des topics et envoyer des MP. |
| **Modérateur** | Membre ayant des droits étendus pour surveiller le contenu et sanctionner. |
| **Administrateur** | Gère les comptes membres et la structure globale du forum. |
| **MessagePrive** | Message envoyé directement d'un membre à un autre (boîte de réception). |
| **Evenement** | Entrée dans le calendrier (planifiée par un membre ou l'admin). |
| **Profil** | Ensemble des informations publiques et privées d'un membre (Avatar, Signature...). |

### Diagramme de Classes (Relations entre classes)

::: center
![](diagrammeclass.png){ width=65% }
:::

\pagebreak

## Question 3: Diagrammes d'États-Transition

| **Post** | **Membre** |
| :---: | :---: |
| ![](diagrammeETPost.png){width=90%} | ![](diagrammeETMembre.png){width=90%} |


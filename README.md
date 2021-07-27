# TemplateLaTeXUQAC

[![Build](https://img.shields.io/circleci/build/github/FlorentinTh/TemplateLaTeXUQAC/master?style=flat-square&token=0fdc873e50de49d6e9868ff847d740d20813f3bd)](https://circleci.com/gh/FlorentinTh/TemplateLaTeXUQAC) [![Last Commit](https://img.shields.io/github/last-commit/FlorentinTh/TemplateLaTeXUQAC?style=flat-square)](https://github.com/FlorentinTh/TemplateLaTeXUQAC/commits/master) [![License](https://img.shields.io/github/license/FlorentinTh/TemplateLaTeXUQAC?style=flat-square)](https://github.com/FlorentinTh/TemplateLaTeXUQAC/blob/master/LICENSE)

[![Release Version](https://img.shields.io/github/release/FlorentinTh/TemplateLaTeXUQAC?style=flat-square)](https://github.com/FlorentinTh/TemplateLaTeXUQAC/releases) ![Release Date](https://img.shields.io/github/release-date/FlorentinTh/TemplateLaTeXUQAC?style=flat-square)

Ce projet est un gabarit LaTeX pour la rédaction de documents pour l'Université du Québec à Chicoutimi (UQAC). Il respecte les directives fournies par le [décanat des études](http://services.uqac.ca/decanat-des-etudes/sous-menu-2/). De plus, il est également possible de l'utiliser pour la rédaction de documents dans les deux langues principales, c'est-à-dire le français et l'anglais.

## Auteurs

**[Florentin Thullier](https://github.com/florentinth)** - _2018_

_**Contact :** [florentin.thullier1@uqac.ca](florentin.thullier1@uqa.ca)_

## Prérequis

- [Docker](https://www.docker.com/get-started)
- [Visual Studio Code](https://code.visualstudio.com/)

## Utilisation

- Cloner le dépôt :

```sh
$ git clone https://github.com/FlorentinTh/TemplateLaTeXUQAC.git
```

- Ouvrir le projet avec VSCode :

```sh
$ cd TemplateLaTeXUQAC
$ code .
```

- Générer le PDF final pour la première fois :

```
$ docker-compose up -d --build
```

> La première fois que vous allez générer le fichier PDF final, cela pourra prendre un certain temps (en fonction de votre matériel). Ne vous inquiétez pas, c'est tout à fait normal et les prochaines itérations seront beaucoup plus rapides.

- Générer le PDF final les fois suivantes :

```sh
$ docker start template_uqac
```

> Si vous n'êtes pas familier avec LaTeX, vous pouvez [télécharger](https://github.com/FlorentinTh/TemplateLaTeXUQAC/archive/master.zip) les fichiers sources de ce dépôt, extraire l'archive et importer le contenu du dossier ```src``` directement dans [Overleaf](https://overleaf.com/).

## Documentation LaTeX

Le contenu du template fournit tous les exemples dont vous pourriez avoir besoin :

- **Chapitre I** :
  - listes
  - citations
  - liens et références
  - notes de bas de page
  - acronymes
  - figures
  - tableaux
- **Chapitre II** :
  - équations
  - théorèmes et preuves
  - algorithmes
- **Chapitre III** :
  - informatique
  - chimie
  - ingénierie
  - physique

## Documentation BibTeX :

- [APA-Provost 6<sup>th</sup>](https://bibliotheque.uqac.ca/rediger-bibliographie/apa-latex)
- IEEE (_coming soon_)

## Licence

Ce projet est sous licence MIT - se référer au fichier [LICENSE](LICENSE) pour de plus amples détails.

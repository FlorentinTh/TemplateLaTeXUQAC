# TemplateLaTeXUQAC

[![Circle CI](https://img.shields.io/circleci/build/github/FlorentinTh/TemplateLaTeXUQAC/master?style=flat-square&token=0fdc873e50de49d6e9868ff847d740d20813f3bd)](https://circleci.com/gh/FlorentinTh/TemplateLaTeXUQAC) [![GitHub Release](https://img.shields.io/github/release/FlorentinTh/TemplateLaTeXUQAC?style=flat-square)](https://github.com/FlorentinTh/TemplateLaTeXUQAC/releases)  [![GitHub](https://img.shields.io/github/license/FlorentinTh/TemplateLaTeXUQAC?style=flat-square)](https://github.com/FlorentinTh/TemplateLaTeXUQAC/blob/master/LICENSE)

Ce projet est un gabarit LaTeX pour la rédaction de documents pour l'Université du Québec à Chicoutimi (UQAC). Il respecte les directives fournies par le [décanat des études](http://services.uqac.ca/decanat-des-etudes/sous-menu-2/). De plus, il est également possible de l'utiliser pour la rédaction de documents dans les deux langues principales, c'est-à-dire le français et l'anglais.

## Auteur

**[Florentin Thullier](https://github.com/florentinth)** - _2018_

_**Contact :** [florentin.thullier1@uqac.ca](florentin.thullier1@uqa.ca)_

## Requirements

- [Docker](https://www.docker.com/get-started)
- [Visual Studio Code](https://code.visualstudio.com/)

## Usage

- Clone the repository :

```sh
$ git clone https://github.com/FlorentinTh/TemplateLaTeXUQAC.git
```

- Open the project with VSCode :

```sh
$ cd TemplateLaTeXUQAC
$ code .
```

- Generate the PDF file for the first time :

```
$ docker-compose -f "docker-compose.yml" up -d --build 
```

> The first time you try to generate the PDF file it may take some time (depending on your hardware). Don't worry, it's totally normal and next tries will be a lot faster.

- Generate the PDF file following times :

```sh
$ docker start latex
```

> If you're not familiar with LaTeX, you can [download](https://github.com/FlorentinTh/TemplateLaTeXUQAC/archive/master.zip) the sources of this repository, extract the archive and upload the content of the ```src``` folder on [Overleaf](https://overleaf.com/).

## Licence

Ce projet est sous licence MIT - se référer au fichier [LICENSE](LICENSE) pour de plus amples détails.

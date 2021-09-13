# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/).

## [2.2.0] - 2021-09-13

### Features

- Add an english reference example in ```references.bib```.

### Bug Fixes

- Add missing required url condition when no doi for all documents in both ```apa-uqac-fr``` and ```apa-uqac-en``` files.

## [2.1.5] - 2021-07-27

### Bug Fixes

- Fix ```unpublished``` entries format.

### Documentation

- Add LaTeX documentation references in template.
- Add BibTeX documentation link.

## [2.1.4] - 2021-07-26

### Bug Fixes

- Fix titles case format in APA-Provost citation style.
- Fix ```inproceedings``` date format entries.

## [2.1.3] - 2021-06-28

### Features

- Add several missing packages (minted, tikz, chemfig, _etc_) in both template and main file.
- Add few missing translations (Theorems, Lemmas, _etc._).

### Bug Fixes

- Fix book title case format in APA-Provost citation style.
- Remove warning for missing ```institution``` field for ```@misc``` objects in APA-Provost citation style.

### Refactors

- Add several samples of TeX code and replace existing ones in main content.

## [2.1.2] - 2021-06-22

### Bug Fixes

- Fix package error to allow build with both ```texlive-2020``` and older version.

## [2.1.1] - 2021-06-22

### Bug Fixes

- Remove some deprecated code in template to remove ```texlive-2020``` related compiling errors.

### Chore

- Update build tools to ```texlive-2020```.

## [2.1] - 2021-06-21

### Features

- Format URLs and DOIs same as text with blue color.

- Add support for orphan lines.
### Bug Fixes

- IEEE FR citation style : translate ```Available``` into ```Repéré à``` for online references.
- Remove spaces before ```:``` for DOIs and editors in order to better respect APA 6th Provost.

## [2.0] - 2021-06-15

### Features

- Add ```ieee-uqac-fr.bst``` and ```ieee-uqac-fr.bst``` files to allow using IEEE bibliographic style.

- Add ```apa``` and ```ieee``` classes to automatically set bibliographic style according to both the precised style and the language.

- Add ```rev``` class for bibliographic revision (it will highlight URLs in green).

### Bug Fixes

⚠️**Breaking Changes**:

- Entirely rewrite both ```apa-uqac-fr.bst``` and ```apa-uqac-en.bst``` bibliographic style as they now completely adopt the APA 6th Provost template without using any custom document type. _Some previous changes (such as ```@patent```) may not work anymore!_

### Chore

- Remove useless PDF examples.

## [1.3.3] - 2021-05-28

### Bug Fixes

- Add missing rule for patent citations that respects APA-Provost citation template used by UQ in both french and english files.

__NOTE : your bib entry should look as follows :__

```tex
@patent{Taniguti1989,
   title = {Pyroelectric infrared sensor},
   assignee = {United States Patent and Trademark Office},
   number = {US-4800278-A},
   author = {Taniguti, Yoshiharu and Edano, Shigeki and Tanaka, Kazuhiko and Taniguti, Shiniti and Kuramoto, Megumi},
   month = jan,
   year = {1989}
 }
```

__If your bib file is exported from *Mendeley*, you should consider updating it manually since this tool currently can't handle patent entries at export. *Zotero* users are safe and *Endnote* users... do they really exist ?__
## [1.3.2] - 2021-05-27

### Bug Fixes

- Replace ```"et"``` by ```"&"``` for two last authors in french citation template.

- Replace ```"and"``` by ```"&"``` for two last authors in english citation template.

- Change DOI formatting according to APA-Provost citation template used by UQ in both french and english citation templates.

- Change ```\url{}``` to be printed in the same font as the rest of the text.

- Replace ```"Récupéré : "``` by ```"Récupéré à : "``` before URL in citation for french template.

## [1.3.1] - 2021-04-08

### Added

- ```\raggedbottom``` option to be used with ```twoside``` class for double-sided documents.

## [1.3] - 2020-11-10

### Changed

- Fix ```figure``` and ```table``` captions to allow short version without ```\cite``` command issue in LoF.
- Edit example accordingly.

## [1.2] - 2020-10-21

### Changed

- Change default left margin.
- Change spacing before and after ```equation``` environment.
- Rename ```Annexe``` to ```Appendice``` in the french class.

## [1.1.5] - 2019-10-21

### Changed

- Default behaviour of ```footnote``` in ```uqac.cls```. Don't reset the number anymore after each new chapter.

## [1.1.4] - 2019-09-16

### Changed

- Dedication environment style in ```uqac.cls```.

## [1.1.3] - 2019-08-08

### Changed

- Fix missing Docker Hub base repository for image used in ```Dockerfile```.

## [1.1.2] - 2019-08-08

### Changed

- Simplify the build of the container through a more complete image [available on Docker Hub](https://hub.docker.com/r/florentinth/tex-project).

## [1.1.1] - 2019-08-07

### Changed

- Change local TeXLive container build to pre-built image [available on Docker Hub](https://hub.docker.com/r/florentinth/texlive-full).

## [1.1] - 2019-08-06

**First public release.**

### Added

- LaTeX build on a Docker container.
- A ```Makefile``` that contains build instructions.
- A ```CHANGELOG.md``` file.
- Continuous Integration scripts for Circle CI tool in ```.circleci```.
- Requirements and usage in ```README.md```.

### Changed

- Project file structure.

## [1.0.9-stable] - 2018-10-04

**Latest private release.**

[1.0.9-stable]: https://github.com/FlorentinTh/TemplateLaTeXUQAC/releases/tag/v1.0.9-stable
[1.1]: https://github.com/florentinth/FlOS/compare/v1.0.9-stable...v1.1
[1.1.1]: https://github.com/florentinth/FlOS/compare/v1.1...v1.1.1
[1.1.2]: https://github.com/florentinth/FlOS/compare/v1.1.1...v1.1.2
[1.1.3]: https://github.com/florentinth/FlOS/compare/v1.1.2...v1.1.3
[1.1.4]: https://github.com/florentinth/FlOS/compare/v1.1.3...v1.1.4
[1.1.5]: https://github.com/florentinth/FlOS/compare/v1.1.4...v1.1.5
[1.2]: https://github.com/florentinth/FlOS/compare/v1.1.5...v1.2
[1.3]: https://github.com/florentinth/FlOS/compare/v1.2...v1.3
[1.3.1]: https://github.com/florentinth/FlOS/compare/v1.3...v1.3.1
[1.3.2]: https://github.com/florentinth/FlOS/compare/v1.3.1...v1.3.2
[1.3.3]: https://github.com/florentinth/FlOS/compare/v1.3.2...v1.3.3
[2.0]: https://github.com/florentinth/FlOS/compare/v1.3.3...v2.0
[2.1]: https://github.com/florentinth/FlOS/compare/v2.0...v2.1
[2.1.1]: https://github.com/florentinth/FlOS/compare/v2.1...v2.1.1
[2.1.2]: https://github.com/florentinth/FlOS/compare/v2.1.1...v2.1.2
[2.1.3]: https://github.com/florentinth/FlOS/compare/v2.1.2...v2.1.3
[2.1.4]: https://github.com/florentinth/FlOS/compare/v2.1.3...v2.1.4
[2.1.5]: https://github.com/florentinth/FlOS/compare/v2.1.4...v2.1.5

[2.2.0]: https://github.com/florentinth/FlOS/compare/v2.1.5...v2.2.0


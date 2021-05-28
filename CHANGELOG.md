# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/).

## [1.3.2] - 2021-05-28

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

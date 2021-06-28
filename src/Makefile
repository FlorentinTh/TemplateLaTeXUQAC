SRC_DIR = "."
FILENAME = main

SRC = $(shell find $(SRC_DIR) -name '*.tex')

help:
	@echo '------------------------------------------------------------------------------------------'
	@echo '--   Makefile to compile the template using "pdflatex -> bibtex -> pdflatex*2" recipe   --'
	@echo '------------------------------------------------------------------------------------------'
	@echo '------------------------------------------------------------------------------------------'
	@echo '-----------------------------             USAGE             ------------------------------'
	@echo '                              make build -> compile template                              '
	@echo '                           make clean -> clean unecessary files                           '
	@echo '------------------------------------------------------------------------------------------'
	@echo '------------------------------------------------------------------------------------------'

build: $(SRC)
	pdflatex -synctex=1 -shell-escape -interaction=nonstopmode -file-line-error $(FILENAME).tex
	bibtex $(FILENAME)
	pdflatex -synctex=1 -shell-escape -interaction=nonstopmode -file-line-error $(FILENAME).tex
	pdflatex -synctex=1 -shell-escape -interaction=nonstopmode -file-line-error $(FILENAME).tex

clean:
	@rm -rf $(SRC_DIR)/*.acn $(SRC_DIR)/*.acr $(SRC_DIR)/*.alg $(SRC_DIR)/*.aux $(SRC_DIR)/*.bbl $(SRC_DIR)/*.blg $(SRC_DIR)/*.brf $(SRC_DIR)/*.fdb_latexmk $(SRC_DIR)/*.fls $(SRC_DIR)/*.glg $(SRC_DIR)/*.glo $(SRC_DIR)/*.gls $(SRC_DIR)/*.idx $(SRC_DIR)/*.ilg $(SRC_DIR)/*.ind $(SRC_DIR)/*.ist $(SRC_DIR)/*.lof $(SRC_DIR)/*.log $(SRC_DIR)/*.lol $(SRC_DIR)/*.lot $(SRC_DIR)/*.out $(SRC_DIR)/*.toc $(SRC_DIR)/*.synctex.gz $(SRC_DIR)/*-eps-converted-to.pdf
	@rm -rf $(SRC_DIR)/**/*.acn $(SRC_DIR)/**/*.acr $(SRC_DIR)/**/*.alg $(SRC_DIR)/**/*.aux $(SRC_DIR)/**/*.bbl $(SRC_DIR)/**/*.blg $(SRC_DIR)/**/*.brf $(SRC_DIR)/**/*.fdb_latexmk $(SRC_DIR)/**/*.fls $(SRC_DIR)/**/*.glg $(SRC_DIR)/**/*.glo $(SRC_DIR)/**/*.gls $(SRC_DIR)/**/*.idx $(SRC_DIR)/**/*.ilg $(SRC_DIR)/**/*.ind $(SRC_DIR)/**/*.ist $(SRC_DIR)/**/*.lof $(SRC_DIR)/**/*.log $(SRC_DIR)/**/*.lol $(SRC_DIR)/**/*.lot $(SRC_DIR)/**/*.out $(SRC_DIR)/*.pyg $(SRC_DIR)/**/*.toc $(SRC_DIR)/**/*.synctex.gz $(SRC_DIR)/**/*-eps-converted-to.pdf $(SRC_DIR)/_minted-main/

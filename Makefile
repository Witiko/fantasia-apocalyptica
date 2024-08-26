main.pdf: main.tex
	$(MAKE) -C images/
	$(MAKE) -C images/frames/
	$(MAKE) -C images/screen2-czech/
	latexmk -lualatex -shell-escape main.tex

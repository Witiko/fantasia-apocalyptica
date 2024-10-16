main.pdf: main.tex
	$(MAKE) -C images/
	$(MAKE) -C images/frames/
	$(MAKE) -C images/screen2-czech/
	$(MAKE) -C images/transition/
	latexmk -lualatex -shell-escape main.tex

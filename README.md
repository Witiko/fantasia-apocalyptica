# Příprava videozáznamu české premiéry multimediálního díla „Fantasia Apocalyptica“

Tento repozitář obsahuje zdrojový kód článku *Příprava videozáznamu české
premiéry multimediálního díla „Fantasia Apocalyptica“*, který se chystám
zveřejnit ve Zpravodaji CSTUGu.

Pro sazbu článku potřebujeme unixový systém s nainstalovanými programy
FFmpeg, GNU Make, ImageMagick a OptiPNG.

PDF dokument [`main.pdf`][1] s textem článku vysázíme následujím příkazem:

``` bash
latexmk -lualatex -shell-escape main.tex
```

 [1]: https://github.com/Witiko/fantasia-apocalyptica/releases/download/latest/main.pdf

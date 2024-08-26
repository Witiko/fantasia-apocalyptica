.PHONY: all

all: screen2-texts-replaced-color-compressed.pdf

%-uncompressed.pdf: %.pdf
	pdftk $< output $@ uncompress

%-compressed.pdf: %.pdf
	pdftk $< output $@ compress

screen2-texts-replaced-color.pdf: screen2-texts-uncompressed.pdf
	< $< sed -e 's/\.686 \.933 \.933 RG \.686 \.933 \.933 rg/1 .890 .902 RG 1 .890 .902 rg/' -e 's/\.627 \.322 \.176 RG \.627 \.322 \.176 rg/.184 .31 .31 RG .184 .31 .31 rg/' | pdftk A=$< B=- cat A1 B2-22 A23 B24-53 A54 B55-77 A78 B79-90 A91 B92-106 A107 B108-125 A126 B127-144 A145 B146-159 A160 B161-182 A183 B184-195 A196 B197-216 A217 B218-236 A237 B238-256 A257 B258-278 A279 B280-288 A289 B290-311 A312 B313-331 A332 B333-357 A358 B359-380 A381 B382-397 A398 B399-426 A427 B428-449 output - > $@
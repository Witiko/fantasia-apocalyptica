.PHONY: all

all: fantasia.pdf fantasia-background.pdf fantasia-effects.pdf fantasia-text.pdf fantasia-effects-406.png

SOURCES=fantasia.cls fantasia.tex ch01.tex ch02.tex ch03.tex ch04.tex ch05.tex ch06.tex ch07.tex ch08.tex ch09.tex ch10.tex ch11.tex ch12.tex ch13.tex ch14.tex ch15.tex ch16.tex ch17.tex ch18.tex ch19.tex ch20.tex ch21.tex ch22.tex

%.pdf: $(SOURCES)
	latexmk $(basename $@)
	latexmk -c $(basename $@)

fantasia-effects-%.png: fantasia-effects.pdf
	pdftk $< cat $$(echo $(basename $@) | sed 's/$(basename $<)-//') output $(basename $@).pdf
	convert -density 600 $(basename $@).pdf -colorspace Lab -filter Lanczos -resize "1920x1200!" -colorspace sRGB $@
	rm $(basename $@).pdf
	convert $@ \( +clone -background white -flatten -fuzz 20% -transparent white -alpha extract -morphology Dilate Disk:5 -alpha copy \) -compose Dst_In -alpha Set -composite -resize 50% -filter Gaussian -define filter:sigma=12 -resize 200% -duplicate 1 -compose Over -composite -duplicate 1 -compose Over -composite $@
	optipng -o 7 $@

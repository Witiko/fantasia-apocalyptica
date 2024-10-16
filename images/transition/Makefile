.PHONY: all
.ONESHELL:
SHELL = bash
.SHELLFLAGS = -e -o xtrace -c

TRANSITIONS=$(addsuffix .jpg,$(addprefix transition-,01 02 03 04 05))
D=5

all: $(TRANSITIONS)

$(TRANSITIONS): 194-small.jpg 195-small.jpg
	ffmpeg -loop 1 -framerate 1 -i $(word 1,$^) \
				 -loop 1 -framerate 1 -i $(word 2,$^) \
				 -filter_complex '
					 [0:v]trim=start=0:end=$D[prvni];
					 [1:v]trim=start=0:end=$D[druhy];
					 [prvni]format=yuva420p,fade=out:st=0:d=$D:alpha=1[stmivacka];
					 [druhy]format=yuva420p,fade=in:st=0:d=$D:alpha=1[roztmivacka];
					 [stmivacka][roztmivacka]overlay[prechod]
				 ' -map '[prechod]' -r 1 transition-%02d.png
	for FILE in transition-0*.png
	do
	  convert $$FILE -quality 100% $${FILE%.png}.jpg
	done
	jpegoptim -m 85 transition-0*.jpg
	cp $(word 2,$^) transition-$$(printf '%02d' $$(($D + 1))).jpg
	rm transition-0*.png

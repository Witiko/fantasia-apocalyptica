.PHONY: all clean implode

INPUT_PROGRESSIVE_FRAMES=$(addprefix input-progressive-frame-,$(addsuffix .png,00 01 02 03 04 05 06))
INPUT_INTERLACED_FRAMES=$(addprefix input-interlaced-frame-,$(addsuffix .png,01 02 03 04 05))
INPUT_UNINTERLACED_SUBFRAMES=$(addprefix input-uninterlaced-subframe-,$(addsuffix .png,1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0))
INPUT_UNINTERLACED_SUBFRAMES_FLAT=$(addprefix input-uninterlaced-subframe-flat-,$(addsuffix .png,1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0))

OUTPUT_MINTERPOLATE_FRAMES=$(addprefix output-minterpolate-frame-,$(addsuffix .png,01 02 03 04 05 06 07 08 09))
OUTPUT_YADIF_FRAMES=$(addprefix output-yadif-frame-,$(addsuffix .png,01 02 03 04 05 06 07 08 09))

INPUT_FRAMES=$(INPUT_PROGRESSIVE_FRAMES) $(INPUT_INTERLACED_FRAMES) $(INPUT_UNINTERLACED_SUBFRAMES_FLAT)
OUTPUT_FRAMES=$(OUTPUT_MINTERPOLATE_FRAMES) $(OUTPUT_YADIF_FRAMES)

FRAMES=$(INPUT_FRAMES) $(OUTPUT_FRAMES)

all: $(FRAMES)
	optipng -o 7 $(FRAMES)
	$(MAKE) clean

input-progressive-frame-00.png: frame.png
	convert $< -bordercolor white -border 10x0 -crop 96x96+0+0 $@

input-progressive-frame-01.png: frame.png
	convert $< -crop 96x96+0+0 $@

input-progressive-frame-01.5.png: frame.png
	convert $< -crop 96x96+5+0 $@

input-progressive-frame-02.png: frame.png
	convert $< -crop 96x96+10+0 $@

input-progressive-frame-02.5.png: frame.png
	convert $< -crop 96x96+14+0 $@

input-progressive-frame-03.png: frame.png
	convert $< -crop 96x96+19+0 $@

input-progressive-frame-03.5.png: frame.png
	convert $< -crop 96x96+24+0 $@

input-progressive-frame-04.png: frame.png
	convert $< -crop 96x96+29+0 $@

input-progressive-frame-04.5.png: frame.png
	convert $< -crop 96x96+33+0 $@

input-progressive-frame-05.png: frame.png
	convert $< -crop 96x96+38+0 $@

input-progressive-frame-05.5.png: frame.png
	convert $< -crop 96x96+43+0 $@

input-progressive-frame-06.png: frame.png
	convert $< -crop 96x96+48+0 $@

temp-output-minterpolate-frame-%.png: $(INPUT_PROGRESSIVE_FRAMES)
	ffmpeg -framerate 1 -i input-progressive-frame-%02d.png -vf minterpolate=fps=2 temp-output-minterpolate-frame-%02d.png

output-minterpolate-frame-01.png: input-progressive-frame-01.png
	cp $< $@

output-minterpolate-frame-02.png: temp-output-minterpolate-frame-04.png
	cp $^ $@

output-minterpolate-frame-03.png: input-progressive-frame-02.png
	cp $< $@

output-minterpolate-frame-04.png: temp-output-minterpolate-frame-06.png
	cp $^ $@

output-minterpolate-frame-05.png: input-progressive-frame-03.png
	cp $< $@

output-minterpolate-frame-06.png: temp-output-minterpolate-frame-08.png
	cp $^ $@

output-minterpolate-frame-07.png: input-progressive-frame-04.png
	cp $< $@

output-minterpolate-frame-08.png: temp-output-minterpolate-frame-10.png
	cp $^ $@

output-minterpolate-frame-09.png: input-progressive-frame-05.png
	cp $< $@

input-uninterlaced-subframe-%.0.png: input-progressive-frame-0%.png
	convert -alpha set $< mask.png -compose DstOut -composite $@

input-uninterlaced-subframe-%.5.png: input-progressive-frame-0%.5.png
	convert -alpha set $< mask-inverse.png -compose DstOut -composite $@

input-interlaced-frame-01.png: input-uninterlaced-subframe-1.0.png input-uninterlaced-subframe-1.5.png
	convert $^ -geometry +0+0 -composite $@

input-interlaced-frame-02.png: input-uninterlaced-subframe-2.0.png input-uninterlaced-subframe-2.5.png
	convert $^ -geometry +0+0 -composite $@

input-interlaced-frame-03.png: input-uninterlaced-subframe-3.0.png input-uninterlaced-subframe-3.5.png
	convert $^ -geometry +0+0 -composite $@

input-interlaced-frame-04.png: input-uninterlaced-subframe-4.0.png input-uninterlaced-subframe-4.5.png
	convert $^ -geometry +0+0 -composite $@

input-interlaced-frame-05.png: input-uninterlaced-subframe-5.0.png input-uninterlaced-subframe-5.5.png
	convert $^ -geometry +0+0 -composite $@

output-yadif-frame-%.png: $(INPUT_INTERLACED_FRAMES)
	ffmpeg -i input-interlaced-frame-%02d.png -vf yadif=mode=1:parity=1 output-yadif-frame-%02d.png

input-uninterlaced-subframe-flat-%.png: input-uninterlaced-subframe-%.png
	convert $< -background white -alpha remove -alpha off $@

clean:
	rm -f $(addprefix input-progressive-frame-,$(addsuffix .png,00 06))
	rm -f $(addprefix input-progressive-frame-,$(addsuffix .5.png,01 02 03 04 05))
	rm -f input-uninterlaced-subframe-5.5.png
	rm -f $(addprefix temp-output-minterpolate-frame-,$(addsuffix .png,01 02 03 04 05 06 07 08 09 10 11))
	rm -f output-yadif-frame-10.png
	rm -f $(INPUT_UNINTERLACED_SUBFRAMES)

implode: clean
	rm -f $(FRAMES)

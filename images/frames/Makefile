.PHONY: all clean implode

INPUT_PROGRESSIVE_FRAMES_SHAKY=$(addprefix input-progressive-frame-shaky-,$(addsuffix .png,01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19))
INPUT_PROGRESSIVE_FRAMES_SHAKY_2X=$(addprefix input-progressive-frame-shaky-2x-,$(addsuffix .png,01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19))
INPUT_PROGRESSIVE_FRAMES=$(addprefix input-progressive-frame-,$(addsuffix .png,00 01 01.5 02 02.5 03 03.5 04 04.5 05 05.5 06))
INPUT_INTERLACED_FRAMES=$(addprefix input-interlaced-frame-,$(addsuffix .png,01 02 03 04 05))
INPUT_UNINTERLACED_SUBFRAMES=$(addprefix input-uninterlaced-subframe-,$(addsuffix .png,1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0))
INPUT_UNINTERLACED_SUBFRAMES_FLAT=$(addprefix input-uninterlaced-subframe-flat-,$(addsuffix .png,1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0))

OUTPUT_VIDSTABTRANSFORM_FRAMES=$(addprefix output-vidstabtransform-frame-,$(addsuffix .png,01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19))
OUTPUT_WAIFU2X_FRAMES=$(addprefix output-waifu2x-frame-,$(addsuffix .png,01 03 05 07 09 11 13 15 17 19))
OUTPUT_MINTERPOLATE_FRAMES=$(addprefix output-minterpolate-frame-,$(addsuffix .png,01 02 03 04 05 06 07 08 09))
OUTPUT_YADIF_FRAMES=$(addprefix output-yadif-frame-,$(addsuffix .png,01 02 03 04 05 06 07 08 09))

INPUT_FRAMES=$(INPUT_PROGRESSIVE_FRAMES_SHAKY) $(INPUT_PROGRESSIVE_FRAMES_SHAKY_2X) $(INPUT_PROGRESSIVE_FRAMES) $(INPUT_INTERLACED_FRAMES) $(INPUT_UNINTERLACED_SUBFRAMES_FLAT)
OUTPUT_FRAMES=$(OUTPUT_VIDSTABTRANSFORM_FRAMES) $(OUTPUT_WAIFU2X_FRAMES) $(OUTPUT_MINTERPOLATE_FRAMES) $(OUTPUT_YADIF_FRAMES)

FRAMES=$(INPUT_FRAMES) $(OUTPUT_FRAMES)

all: $(FRAMES)
	optipng -o 7 $(FRAMES)
	$(MAKE) clean

input-progressive-frame-shaky-01.png: frame.png
	convert $< -bordercolor white -border 0x5 -crop 96x96+0+10 $@

input-progressive-frame-shaky-02.png: frame.png
	convert $< -bordercolor white -border 0x2 -crop 96x96+5+0 $@

input-progressive-frame-shaky-03.png: frame.png
	convert $< -bordercolor white -border 0x1 -crop 96x96+10+0 $@

input-progressive-frame-shaky-04.png: frame.png
	convert $< -bordercolor white -border 0x0 -crop 96x96+14+0 $@

input-progressive-frame-shaky-05.png: frame.png
	convert $< -bordercolor white -border 0x2 -crop 96x96+19+0 $@

input-progressive-frame-shaky-06.png: frame.png
	convert $< -bordercolor white -border 0x2 -crop 96x96+24+4 $@

input-progressive-frame-shaky-07.png: frame.png
	convert $< -bordercolor white -border 0x1 -crop 96x96+29+2 $@

input-progressive-frame-shaky-08.png: frame.png
	convert $< -bordercolor white -border 0x3 -crop 96x96+33+6 $@

input-progressive-frame-shaky-09.png: frame.png
	convert $< -bordercolor white -border 0x0 -crop 96x96+38+0 $@

input-progressive-frame-shaky-10.png: frame.png
	convert $< -bordercolor white -border 0x3 -crop 96x96+43+6 $@

input-progressive-frame-shaky-11.png: frame.png
	convert $< -bordercolor white -border 0x3 -crop 96x96+48+6 $@

input-progressive-frame-shaky-12.png: frame.png
	convert $< -bordercolor white -border 0x0 -crop 96x96+52+0 $@

input-progressive-frame-shaky-13.png: frame.png
	convert $< -bordercolor white -border 0x0 -crop 96x96+57+0 $@

input-progressive-frame-shaky-14.png: frame.png
	convert $< -bordercolor white -border 0x0 -crop 96x96+62+0 $@

input-progressive-frame-shaky-15.png: frame.png
	convert $< -bordercolor white -border 0x6 -crop 96x96+67+12 $@

input-progressive-frame-shaky-16.png: frame.png
	convert $< -bordercolor white -border 0x1 -crop 96x96+71+0 $@

input-progressive-frame-shaky-17.png: frame.png
	convert $< -bordercolor white -border 0x2 -crop 96x96+76+0 $@

input-progressive-frame-shaky-18.png: frame.png
	convert $< -bordercolor white -border 0x2 -crop 96x96+81+4 $@

input-progressive-frame-shaky-19.png: frame.png
	convert $< -bordercolor white -border 0x0 -crop 96x96+86+0 $@

output-vidstabtransform-frame-%.png: $(INPUT_PROGRESSIVE_FRAMES_SHAKY)
	ffmpeg -framerate 1 -i input-progressive-frame-shaky-%02d.png -vf vidstabdetect=result=temp-output-vidstabtransform.trf:stepsize=1 -f null -
	ffmpeg -framerate 1 -i input-progressive-frame-shaky-%02d.png -vf vidstabtransform=input=temp-output-vidstabtransform.trf output-vidstabtransform-frame-%02d.png

input-progressive-frame-shaky-2x-%.png: input-progressive-frame-shaky-%.png
	test -e $@ && touch $@ || docker run --gpus all --rm -v "$$PWD":/images nagadomi/waifu2x th waifu2x.lua -i /images/$< -model_dir models/photo -tta 1 -tta_level 8 -o /images/$@

output-waifu2x-frame-%.png: $(INPUT_PROGRESSIVE_FRAMES_SHAKY_2X)
	optipng -o 7 $^
	ffmpeg -framerate 1 -i input-progressive-frame-shaky-2x-%02d.png -vf vidstabdetect=result=temp-output-waifu2x.trf:stepsize=1 -f null -
	ffmpeg -framerate 1 -i input-progressive-frame-shaky-2x-%02d.png -vf vidstabtransform=input=temp-output-waifu2x.trf output-waifu2x-frame-%02d.png

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
	rm -f $(addprefix output-waifu2x-frame-,$(addsuffix .png,02 04 06 08 10 12 14 16 18))
	rm -f input-uninterlaced-subframe-5.5.png
	rm -f $(addprefix temp-output-minterpolate-frame-,$(addsuffix .png,01 02 03 04 05 06 07 08 09 10 11))
	rm -f output-yadif-frame-10.png
	rm -f $(INPUT_UNINTERLACED_SUBFRAMES)
	rm -f temp-output-vidstabtransform.trf
	rm -f temp-output-waifu2x.trf

implode: clean
	rm -f $(FRAMES)

PDFFILES = $(patsubst %.tex,%.pdf,$(wildcard *.tex))
PNGFILES = $(patsubst %.tex,%.png,$(wildcard *.tex))

all: $(PNGFILES)

.PHONY : all clean init

%.pdf : %.tex
	pdflatex $<

%.png : %.pdf
	convert -antialias -density 200 -background none $< $@

clean:
	@echo "suppression des fichiers de compilation"
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.out *.nav *.snm *.bbl *.blg *.vrb

init: clean
	@echo "suppression des fichiers cibles"
	@rm -f $(PDFFILES)
	@rm -f $(PNGFILES)

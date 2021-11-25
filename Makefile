MAIN ?= main

all:
	@TEXINPUTS="sty:" bin/latexrun $(MAIN)

spell:
	@for i in *.tex; do bin/aspell.sh $$i; done
	@for i in *.tex; do bin/double.pl $$i; done
	@for i in *.tex; do bin/abbrv.pl  $$i; done
	@bin/hyphens.sh *.tex

clean:
	@bin/latexrun --clean

.PHONY: all clean spell

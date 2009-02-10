ARQUIVO=UFRN-DIMAp-2006-100-RT
DVIVIEWER=xdvi
PDFVIEWER=xpdf

.SIFFIXES: .dvi .tex .pdf

.dvi.pdf:
	dvipdf $<

.tex.dvi:
	latex $< && bibtex $(patsubst %.tex,%,$<) && latex $< && latex $< || $(RM) $@


all: $(ARQUIVO).dvi

dviview: $(ARQUIVO).dvi
	$(DVIVIEWER) $<

pdf: $(ARQUIVO).pdf

pdfview: $(ARQUIVO).pdf
	$(PDFVIEWER) $<

$(ARQUIVO).pdf: $(ARQUIVO).dvi
	dvipdf $< #$(patsubst %.dvi,%.pdf,$<)

clean:
	$(RM) *.dvi *.log *.aux *.bbl *.blg *.pdf *.toc

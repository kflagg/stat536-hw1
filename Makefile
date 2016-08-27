all: hw1.pdf

clean:
	rm -rf *.aux *.gz *.log *.tex .Rhistory *~ figure cache

hw1.pdf: hw1.tex
	if [ ! -e hw1.aux ] ; then pdflatex hw1.tex ; fi
	pdflatex hw1.tex
	Rscript --vanilla -e "require(extrafont);embed_fonts('hw1.pdf')"

hw1.tex: hw1.rnw rawbozemandata.csv
	Rscript --vanilla -e "require(knitr);knit('hw1.rnw')"

rawbozemandata.csv:
	wget https://dl.dropboxusercontent.com/u/77307195/rawbozemandata.csv

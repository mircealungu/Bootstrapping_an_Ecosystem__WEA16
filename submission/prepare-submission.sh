# Script assumes: 
  
  # 1. main latex file is ../main.tex

  # 2. the following files are needed
  cp ../sig-alternate-05-2015.cls .
  cp ../acmcopyright.sty .
  
  # 3. the images folder is required for compilation
  # and will also be added to the final zip file 
  # together with the main.tex
  cp -R ../images .

# The output file name 
FILENAME=WEA2016_Lungu_Bootstrapping\ an\ ecosystem


# Download and compile flatex
curl http://ftp.snt.utwente.nl/pub/software/tex/support/flatex/flatex.c > flatex.c
cc flatex.c -o flatex

(cd ..; flatex main.tex)

cp ../main.flt main.tex


pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex

if [ $? -eq 0 ]; then

	zip -r "$FILENAME.zip" images/ main.tex
	cp main.pdf "$FILENAME.pdf"

	find . | grep zip|pdf|
	find . | grep -v "$FILENAME" | grep -v prepare-submission | xargs rm -rf
else
	echo "could not compile the generated file"
fi

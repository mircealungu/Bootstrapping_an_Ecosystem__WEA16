FILENAME=WEA2016_Lungu_Bootstrapping\ an\ ecosystem

cp ../sig-alternate-05-2015.cls .
cp ../acmcopyright.sty .
cp -R ../images .

# get and compile flatex
curl http://ftp.snt.utwente.nl/pub/software/tex/support/flatex/flatex.c > flatex.c
cc flatex.c -o flatex

(cd ..; flatex main.tex)

cp ../main.flt main.tex

pdflatex main.tex

zip -r "$FILENAME.zip" images/ main.tex
cp main.pdf "$FILENAME.pdf"

find . | grep zip|pdf|
find . | grep -v "$FILENAME" | grep -v prepare-submission | xargs rm -rf
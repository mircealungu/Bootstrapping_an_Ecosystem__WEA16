cp ../sig-alternate-05-2015.cls .
cp ../acmcopyright.sty .
cp -R ../images .

# get and compile flatex
curl http://ftp.snt.utwente.nl/pub/software/tex/support/flatex/flatex.c > flatex.c
cc flatex.c -o flatex

flatex ../main.tex
all: pdf

install:
	rm -rf mir-tex
	rm -rf mir-biblio
	git clone git@github.com:mircealungu/mir-tex
	git clone git@github.com:mircealungu/mir-biblio

pdf:
	latexmk -pdf

clean:
	latexmk -C

view:
	evince main.pdf &


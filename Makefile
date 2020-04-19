all: build run

build:
	xelatex kursinis.tex
	biber kursinis
	xelatex kursinis.tex

run:
	open kursinis.pdf || xdg-open kursinis.pdf

macos:
	echo "Diegiamas LaTeX (PdfLaTeX, XeTeX ir kt.)"
	brew cask install mactex
	echo "Diegiama literatūros sąrašo tvarkyklė Biber skirta BibLaTeX paketui"
	sudo tlmgr install biber
	echo "Diegiami OpenType šriftai"
	brew cask install fonts-texgyre
	echo "Diegiamas Palemonas šriftas į sistemą"
	sudo cp -r Palemonas-2.1 /usr/share/fonts/truetype/

clean:
	git clean -dfx

docker:
	docker build -t docker-latex .
	docker run --rm -ti -v ${PWD}:/course-project:Z docker-latex bash -c "make build && make clean"

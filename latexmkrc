# Compila monografia.tex com pdflatex + BibTeX (abntex2cite)
@default_files = ('monografia.tex');
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;
$clean_ext = 'bbl brf lof lot lol loa synctex.gz run.xml';

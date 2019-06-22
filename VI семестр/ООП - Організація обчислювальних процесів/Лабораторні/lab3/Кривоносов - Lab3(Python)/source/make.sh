#!/bin/bash

python3 l3.py 
pdflatex report.tex
bibtex report
pdflatex report.tex
pdflatex report.tex

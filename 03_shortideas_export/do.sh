#!/bin/sh
latex 03_shortideas.tex
dvips -t a4 03_shortideas.dvi
ps2pdf 03_shortideas.ps
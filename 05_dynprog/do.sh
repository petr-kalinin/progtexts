#!/bin/sh
cd texts/05_2_fundamental
mpost graph.mp
mpost tree.mp
cd ../..
latex 05_dynprog.tex
dvipdfmx -p a4 05_dynprog.dvi
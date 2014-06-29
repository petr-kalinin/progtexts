#!/bin/sh
cd texts/01_1_elementary
mpost tree.mp
cd ../..
latex 01_backtrack.tex
dvipdfmx -p a4 01_backtrack.dvi
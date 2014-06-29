#!/bin/sh
cd texts/04_1_dfs
mpost graph.mp
cd ../04_2_simple
mpost graph.mp
cd ../04_3_topsort
mpost graph.mp
cd ../04_4_bridges
mpost conj.mp
cd ../..
latex 04_dfs.tex
dvipdfmx -p a4 04_dfs.dvi
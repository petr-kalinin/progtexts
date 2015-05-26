#!/bin/bash
pushd ../01_backtrack
./do_main.sh
popd

latex --shell-escape algoprog.tex
dvipdfmx -p a4 algoprog.dvi

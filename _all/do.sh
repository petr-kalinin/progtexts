#!/bin/bash
pushd ../01_backtrack
./do_main.sh
popd

latex algoprog.tex
dvipdfmx -p a4 algoprog.dvi
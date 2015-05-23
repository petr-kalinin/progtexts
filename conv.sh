#!/bin/sh
dos2unix $1
iconv -f cp866 -t utf8 <$1 >$1.utf8
mv $1.utf8 $1
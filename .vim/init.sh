#!/bin/bash
WORKSPACE=`pwd`
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
cscope -Rbq *

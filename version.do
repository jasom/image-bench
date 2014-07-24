redo-ifchange ./config
. ./config
for l in $LISP; do $l --version |head -n1 ; done

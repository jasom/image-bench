redo-ifchange ./config
. ./config
redo-ifchange alot.c
gcc -O2 -DITERATIONS=$ALOT -o $3 alot.c

redo-ifchange ./config
. ./config

ITERATIONS=100

redo-ifchange ./version
DEPS="$LISP $(for item in $LISP;do echo "$item.big"; done)"
redo-ifchange $DEPS alot

cat version >&2
echo >&2

for item in /bin/true $DEPS; do
impl="$(ls -s $item)"
printf "%s " "$impl" >&2
export ITERATIONS
/usr/bin/time -f "%P %e" ./alot $ITERATIONS $item 2>&1 |(read -r pct abs; echo $pct $(echo "scale=4; $abs / $ITERATIONS"|bc) >&2)
done

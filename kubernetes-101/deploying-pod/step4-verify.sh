var1=$(kubectl get pods -o jsonpath="{.items[?(@.metadata.name)].metadata.name}" | grep -ow exercise )
var2="exercise"

var3=$(kubectl get pods -o jsonpath="{.items[?(@.metadata.name)].metadata.name}" | grep -ow exercise-yaml )
var4="exercise-yaml"
[ "$var1" == $var2 ] &&  "$var3" == $var4 ] && echo "done"
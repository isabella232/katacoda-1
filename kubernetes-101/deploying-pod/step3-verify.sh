var1=$(kubectl get pods -o jsonpath="{.items[?(@.metadata.name)].metadata.name}" | grep -ow http-yaml )
var2="http-yaml"
[ "$var1" == $var2 ] && echo "done"
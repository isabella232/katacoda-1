var1=$(kubectl get pods -o jsonpath="{.items[?(@.metadata.name)].metadata.name}" | grep -ow http )
var2="http"
[ "$var1" == $var2 ] && echo "done"
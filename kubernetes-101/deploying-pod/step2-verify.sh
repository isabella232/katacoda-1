var1=$(kubectl get pods -o jsonpath="{.items[?(@.metadata.name)].metadata.name}" | grep -o http )
var2="http"
[ "$var1" == $var2 ] && echo "done"
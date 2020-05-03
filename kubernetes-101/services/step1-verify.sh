# Verify the http pod
var1=$(kubectl get deployments -o jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'| grep -ow "http")
var2="http"

[ "$var1" == "$var2" ] && echo "done"
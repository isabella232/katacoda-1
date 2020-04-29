# Verify the http pod
var1=$(kubectl get namespaces -o jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'| grep -ow "manifest")
var2="manifest"

[ "$var1" == "$var2" ]&&echo "done"
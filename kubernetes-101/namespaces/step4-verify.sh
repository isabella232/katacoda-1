# Verify the http pod
var1=$(kubectl get namespaces -o jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'| grep -ow "exercise")
var2="exercise"
var3=$(kubectl get namespaces -o jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'| grep -ow "yaml")
var4="yaml"

[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&echo "done"
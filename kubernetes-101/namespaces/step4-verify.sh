# Verify the http pod
var1=$(kubectl get namespaces -o jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'| grep -ow "kubernetes-101")
var2=""
var3=$(kubectl get namespaces -o jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'| grep -ow "yaml-namespace")
var4=""

[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&echo "done"
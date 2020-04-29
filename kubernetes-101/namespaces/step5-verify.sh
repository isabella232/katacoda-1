# Verify the redis manifest pod
var1=$(kubectl get pods -n manifest -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.metadata.namespace}{"\n"}{end}'| grep -ow "redis manifest")
var2="redis manifest"
[ "$var1" == "$var2" ]  && echo "done"
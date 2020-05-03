# Verify the http pod
var1=$(kubectl get deployments -l customlabel=condenast -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.replicas}{"\n"}{end}'| grep -ow "http 3")
var2="http 3"

[ "$var1" == "$var2" ] && echo "done"
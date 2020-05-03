# Verify the http pod
var1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{"\n"}{end}'| grep -ow "targetporthttp ClusterIP 8000")
var2="targetporthttp ClusterIP 8000"
var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{"\n"}{end}'| grep -ow "targetportyaml ClusterIP 8001")
var4="targetportyaml ClusterIP 8001"

[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&echo "done"
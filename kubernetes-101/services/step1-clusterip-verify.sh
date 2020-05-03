# Verify the http pod
var1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{"\n"}{end}'| grep -ow "clusterhttp ClusterIP 80")
var2="clusterhttp ClusterIP 80"
var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{"\n"}{end}'| grep -ow "http ClusterIP 80")
var4="http ClusterIP 80"

[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&echo "done"
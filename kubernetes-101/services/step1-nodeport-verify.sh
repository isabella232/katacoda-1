# Verify the http pod
var1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{"\n"}{end}'| grep -ow "clusterhttp ClusterIP")
var2="clusterhttp ClusterIP"
var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{"\n"}{end}'| grep -ow "http ClusterIP")
var4="http ClusterIP"

[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&echo "done"
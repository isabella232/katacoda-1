# Verify the http pod
var1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "clusterhttp ClusterIP 80 [$HOST_IP]")
var2="clusterhttp ClusterIP 80 [$HOST_IP]"
var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "http ClusterIP 80 [$HOST_IP]")
var4="http ClusterIP 80 [$HOST_IP]"

[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&echo "done"
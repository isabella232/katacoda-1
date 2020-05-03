# Verify the http pod
var1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "externalhttp ClusterIP 8002 \[$HOST_IP\]")
var2="externalhttp ClusterIP 8002 [$HOST_IP]"
var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "externalyaml ClusterIP 8003 \[$HOST_IP\]")
var4="externalyaml ClusterIP 8003 [$HOST_IP]"

[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&echo "done"
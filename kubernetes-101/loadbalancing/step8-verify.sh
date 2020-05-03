var1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "http-service LoadBalancer 8765")
var2="http-service LoadBalancer 8765"
var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "yaml-service LoadBalancer 8765")
var4="yaml-service LoadBalancer 8765"
[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ]&&echo "done"
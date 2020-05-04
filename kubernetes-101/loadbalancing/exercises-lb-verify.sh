var1=$(kubectl get rc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.replicas}{"\n"}{end}'| grep -ow "exercise-nginx 3")
var2="exercise-nginx 3"
var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "exercise-service LoadBalancer 5678")
var4="exercise-service LoadBalancer 5678"
[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ]&&echo "done"
var1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{"\n"}{end}'| grep -ow "exercise ClusterIP 80")
var2="exercise ClusterIP 80"

var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{"\n"}{end}'| grep -ow "exercisetarget ClusterIP 8006")
var4="exercisetarget ClusterIP 8006"

var5=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "exerciseexternal ClusterIP 8007 \[$HOST_IP\]")
var6="exerciseexternal ClusterIP 8007"

var7=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "exercisenodeport NodePort 80")
var8="exercisenodeport NodePort 80"
[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ]&&[ "$var5" == "$var6" ] && [ "$var7" == "$var8" ]&&echo "done"
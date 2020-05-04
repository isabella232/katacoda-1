# Verify the http pod
var1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "nodeporthttp NodePort 80")
var2="nodeporthttp NodePort 80"
var3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "nodeportyaml NodePort 80")
var4="nodeportyaml NodePort 80"

[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&echo "done"
# Verify the http pod

export externalvar1=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "externalhttp ClusterIP 8002")
export externalvar2="externalhttp ClusterIP 8002"
export externalvar3=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{" "}{@.spec.externalIPs}{"\n"}{end}'| grep -ow "externalyaml ClusterIP 8003")
export externalvar4="externalyaml ClusterIP 8003"

[ "$externalvar1" == "$externalvar2" ] && [ "$externalvar3" == "$externalvar4" ] &&echo "done"
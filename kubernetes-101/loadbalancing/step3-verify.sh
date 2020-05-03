var1=$(kubectl get deployments -n kube-system -o jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'| grep -ow "nginx-ingress-controller")
var2="nginx-ingress-controller"
[ "$var1" == "$var2" ] &&echo "done"
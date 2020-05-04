# Verify the http-yaml pod
var1=$(kubectl get ingress -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.rules[]}{"\n"}{end}'|grep  "example-ingress map\[host:kubernetes101.info http:map\[paths:\[map\[backend:map\[serviceName:web servicePort:8080\] path:/\] map\[backend:map\[serviceName:web2 servicePort:8080\] path:/v2/\*\]\]\]\]")
var2="example-ingress map[host:kubernetes101.info http:map[paths:[map[backend:map[serviceName:web servicePort:8080] path:/] map[backend:map[serviceName:web2 servicePort:8080] path:/v2/*]]]]"
var3=$(kubectl get deployment -o=jsonpath="{range .items[*]}{.metadata.name}{' '}{range .spec.template.spec.containers[*]}{.image}{'\n'}{end}"| grep -ow "web2 gcr.io/google-samples/hello-app:2.0")
var4="web2 gcr.io/google-samples/hello-app:2.0"

[ "$var1" == "$var2" ] &&[ "$var3" == "$var4" ] && echo "done"
# Verify the http-yaml pod
var1=$(kubectl get pods -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.containers[].image}{"\n"}{end}'| grep -ow "http-yaml katacoda/docker-http-server:latest")
var2="http-yaml katacoda/docker-http-server:latest"

[ "$var1" == "$var2" ] && echo "done"

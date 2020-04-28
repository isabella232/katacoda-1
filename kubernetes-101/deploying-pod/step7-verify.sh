# Verify all pods are deleted
var1=$(kubectl get pods -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.containers[].image}{"\n"}{end}')
var2=""
[ "$var1" == "$var2" ]  && echo "done"
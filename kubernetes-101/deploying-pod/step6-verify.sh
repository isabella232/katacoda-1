# Verify the updated exercise-yaml pod
var1=$(kubectl get pods -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.containers[].image}{"\n"}{end}'| grep -ow "exercise-yaml jenniferstrej/jen-nginx:1.0")
var2="exercise-yaml jenniferstrej/jen-nginx:1.0"
[ "$var1" == "$var2" ]  && echo "done"
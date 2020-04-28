# Verify the exercise pod
var1=$(kubectl get pods -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.containers[].image}{"\n"}{end}'| grep -ow "exercise jenniferstrej/jen-nginx:1.0")
var2="exercise jenniferstrej/jen-nginx:1.0"

# Verify the exercise-yaml pod
var3=$(kubectl get pods -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.containers[].image}{"\n"}{end}'| grep -ow "exercise-yaml jenniferstrej/jen-nginx:1.1")
var4="exercise-yaml jenniferstrej/jen-nginx:1.1"
[ "$var1" == "$var2" ] &&  [ "$var3" == "$var4" ] && echo "done"
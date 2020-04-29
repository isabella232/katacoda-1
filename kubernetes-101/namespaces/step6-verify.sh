# Verify the redis manifest pod
var1=$(kubectl get pods -n lab1 -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.metadata.namespace}{"\n"}{end}'| grep -ow "happyelephant lab1")
var2="happyelephant lab1"
var3=$(kubectl get pods -n lab1 -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.metadata.namespace}{"\n"}{end}'| grep -ow "happymonkey lab1")
var4="happymonkey lab1"
[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ]  && echo "done"
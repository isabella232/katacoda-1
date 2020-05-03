export var1=$(kubectl get deployment -o=jsonpath="{range .items[*]}{.metadata.name}{' '}{range .spec.template.spec.containers[*]}{.image}{'\n'}{end}"| grep -ow "exercise gcr.io/google-samples/hello-app:1.0")
export var2="exercise gcr.io/google-samples/hello-app:1.0"

export var3=$(kubectl get deployment -o=jsonpath="{range .items[*]}{.metadata.name}{' '}{range .spec.template.spec.containers[*]}{.image}{'\n'}{end}"| grep -ow "exercise2 gcr.io/google-samples/hello-app:2.0")
export var4="exercise2 gcr.io/google-samples/hello-app:2.0"

export var5=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{"\n"}{end}'| grep -ow "exercise2 NodePort 8080")
export var6="exercise2 NodePort 8080"

export var7=$(kubectl get svc -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.type}{" "}{@.spec.ports[].port}{"\n"}{end}'| grep -ow "exercise NodePort 8080")
export var8="exercise NodePort 8080"

export var9=$(kubectl get ingress -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.rules[]}{"\n"}{end}'|grep  "exercise map\[host:exercise101.info http:map\[paths:\[map\[backend:map\[serviceName:exercise servicePort:8080\] path:/\] map\[backend:map\[serviceName:exercise2 servicePort:8080\] path:/exercise/\*\]\]\]\]")
export var10="exercise map[host:exercise101.info http:map[paths:[map[backend:map[serviceName:exercise servicePort:8080] path:/] map[backend:map[serviceName:exercise2 servicePort:8080] path:/exercise/*]]]]"

[ "$var1" == "$var2" ] && echo "done"
[ "$var1" == "$var2" ] && [ "$var3" == "$var4" ] &&[ "$var5" == "$var6" ] &&[ "$var7" == "$var8" ] &&[ "$var9" == "$var10" ] && echo "done"
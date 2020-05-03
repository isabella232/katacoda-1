# Verify the http-yaml pod
var1=$(kubectl get deployment -o=jsonpath="{range .items[*]}{.metadata.name}{' '}{range .spec.template.spec.containers[*]}{.image}{'\n'}{end}"| grep -ow "web gcr.io/google-samples/hello-app:1.0")
var2="web gcr.io/google-samples/hello-app:1.0"

[ "$var1" == "$var2" ] && echo "done"
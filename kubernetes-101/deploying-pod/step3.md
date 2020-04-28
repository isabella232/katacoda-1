We can also create a similar pod by using the YAML file (more help can be found [here](https://www.tutorialspoint.com/kubernetes/kubernetes_pod.htm))

## Task 

```
cat << EOF > /tmp/storageos-secret.yaml
apiVersion: v1
 kind: Pod
 metadata:
   labels:
     run: jen-nginx
   name: jen-nginx
 spec:
   containers:
   - image: jenniferstrej/jen-nginx:1.1
     name: jen-nginx
```

<pre>
"files": [
    "http-pod.yayml"
]
</pre>
<pre class="file"
 data-filename="http-pod.yaml"
  data-target="replace">
  apiVersion: v1
   kind: Pod
   metadata:
     labels:
       run: jen-nginx
     name: jen-nginx
   spec:
     containers:
     - image: jenniferstrej/jen-nginx:1.1
       name: jen-nginx
       </pre>
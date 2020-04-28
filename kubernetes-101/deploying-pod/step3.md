We can also create a similar pod by using the YAML file (more help can be found [here](https://www.tutorialspoint.com/kubernetes/kubernetes_pod.htm))

## Task 

<pre class="file"
 data-filename="http-pod.yaml"
  data-target="replace">
  apiVersion: v1
   kind: Pod
   metadata:
     labels:
       run: kubernetes101-http-yaml
     name: kubernetes101-http-yaml
   spec:
     containers:
     - image: katacoda/docker-http-server:latest
       name: http-yaml</pre>
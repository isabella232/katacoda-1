We can also create a similar pod by creating a [manifest](https://kubernetes.io/docs/reference/glossary/?all=true#term-manifest) using the YAML file (more help can be found [here](https://www.tutorialspoint.com/kubernetes/kubernetes_pod.htm))

## Task 

Copy the following definition to the editor. The definition defines how to launch an application called http-yaml using the Docker Image katacoda/docker-http-server.
<pre class="file"
data-filename="http-pod.yaml"
data-target="replace">
apiVersion: v1
kind: Pod
metadata:
 labels:
   run: http-yaml
 name: http-yaml
spec:
 containers:
 - image: katacoda/docker-http-server:v4
   name: http-yaml</pre>
       
If the file does not open, click the link to the file below.

`http-pod.yaml`{{open}}

Once the file has been updated, you can verify it's contents by running `cat http-pod.yaml`{{execute}}.

You can then run the following command to create the pod `kubectl apply -f http-pod.yaml`{{execute}}.

You can then use kubectl to see that the new pod has been added and you should see the `http-yaml` pod below.

`kubectl get pods`{{execute}}

To find out what Kubernetes created you can describe the deployment process.

`kubectl describe pod http-yaml`{{execute}}

The description includes labels specified and the events associated with the pod. These events will highlight any problems and errors that might have occurred.

In the next step we'll expose the running service.

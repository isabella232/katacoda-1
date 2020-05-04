We can also update the [manifest](https://kubernetes.io/docs/reference/glossary/?all=true#term-manifest) of an existing pod by updating the YAML file (more help can be found [here](https://www.tutorialspoint.com/kubernetes/kubernetes_pod.htm))

This is particularly useful if you need to upgrade/downgrade the image version of if any other details may need to be edited.

## Task 
Open the original **http-pod** yaml file. `http-pod.yaml`{{open}}

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

Within the **image** section update the version of the docker-http-server to **v4** from **v1**

If you're stuck or the manifest has been corrupted. Click **Show Solution** and copy the updated yaml into the file and return to this screen.
       
If the file does not open, click the link to the file below.

`http-pod.yaml`{{open}}

Once the file has been updated, you can verify it's contents by running `cat http-pod.yaml`{{execute}}.

You can then run the following command to create the pod `kubectl apply -f http-pod.yaml`{{execute}}.

You can then use kubectl to see that the **http-yaml** pod now has the **healthy** version of the docker image.

`kubectl describe pod http-yaml`{{execute}}

The description should now show that the image tag is using the **healthy** version.


This section shows the solutions to the exercises in this section

**Exercise 1:-** Creating a pod from the command line

`kubectl run --generator=run-pod/v1 exercise --image=jenniferstrej/jen-nginx:1.0`{{execute}}

**Exercise 2:-** Creating a pod manifest

Create a manifest with the filename `exercise.yaml`{{open}} with the image **jenniferstrej/jen-nginx:1.1** and the podname **exercise-yaml**. 

<pre class="file"
data-filename="exercise.yaml"
data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: exercise-yaml
  name: exercise-yaml
spec:
  containers:
  - image: jenniferstrej/jen-nginx:1.1
    name: exercise-yaml</pre>

**Exercise 3:-** Create the pod using the manifest

`kubectl apply -f exercise.yaml`{{execute}}
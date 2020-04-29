
**Exercise 1:-**
Create a namespace titled **lab1** using the **kubectl** CLI.

>**Solution**
`kubectl create namespace lab1`{{execute}}

**Exercise 2:-** Create a pod using the kubectl CLI with the following constraints.

* **Pod name**: happymonkey
* **Namespace**: lab1
* **Container Image**: jenkins:latest

>**Solution**
>`kubectl run --generator=run-pod/v1 happymonkey -n lab1 --image=jenkins:latest`{{execute}}

**Exercise 3:-**
Check **happymonkey** is running successfully
>**Solution**
`kubectl get pods -n lab1`{{execute}}

**Exercise 4:-**
Create a namespace titled **manifest** using the YAML manifest using the `exercise.yaml`{{open}} file.
>**Solution**
<pre class="file"
data-filename="lab.yaml"
data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: happyelephant
  namespace: lab1
  labels: 
    app: elephant
    custom: label
    company: CondeNast   
spec:
  containers:
  - name: happyelephant
    image: jenkins:latest
    ports:
    - name: jenkinsport
      containerPort: 8080
      protocol: TCP</pre>
  
>Then run `kubectl apply -f lab.yaml`{{execute}}

**Exercise 5:-** Check **happyelephant** is running successfully
>**Solution**
>
>Run `kubectl get pods -n lab1`{{execute}}
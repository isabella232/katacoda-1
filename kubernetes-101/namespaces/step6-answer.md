##Exercises

**Exercise 1:-**
Create a namespace titled **exercise** using the **kubectl** CLI.

`kubectl run --generator=run-pod/v1 happymonkey -n lab1 --image=jenkins:latest`{{execute}}
**Exercise 2:-**
Create a namespace titled **manifest** using the YAML manifest using the `exercise.yaml`{{open}} file.

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
  
Then run `kubectl apply -f lab.yaml`{{execute}}
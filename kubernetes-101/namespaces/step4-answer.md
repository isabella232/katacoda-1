**Exercise 1:-**
Create a namespace titled **exercise** using the **kubectl** CLI.
>**Solution**
`kubectl create namespace exercise`{{execute}}

**Exercise 2:-**
Create a namespace titled **manifest** using the YAML manifest using the `exercise.yaml`{{open}} file.
>**Solution**
<pre class="file"
data-filename="exercise.yaml"
data-target="replace">
apiVersion: v1
kind: Namespace
metadata:
  name: manifest</pre>  
Then run `kubectl apply -f exercise.yaml`{{execute}}
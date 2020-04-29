Similar to pods, we can create our new namespaces using the CLI or through a YAML manifest.

## Kubectl CLI
Creating a namespace can be done with a single command using the `kubectl` cli. 

### Task
Let's create `kubernetes-101` namespace:
`kubectl create namespace kubernetes-101`{{execute}}

## YAML manifest
Creating a namespace can also be done using a YAML manifest in the same way as our pod resource. 

### Task
Let's create `yaml-namespace` namespace:

Copy the following definition to the editor. The definition defines how to launch an application called `yaml-namespace`
<pre class="file"
data-filename="namespace.yaml"
data-target="replace">
apiVersion: v1
kind: Namespace
metadata:
  name: yaml-namespace</pre>
       
If the file does not open, click the link to the file below.

`namespace.yaml`{{open}}

Once the file has been updated, you can verify it's contents by running `cat namespace.yaml`{{execute}}.

You can then run the following command to create the pod `kubectl apply -f namespace.yaml`{{execute}}.

## List all namespace
To verify that we have the new namespaces created we can check by running `kubectl get namespaces`{{execute}}

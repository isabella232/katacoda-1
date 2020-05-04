Instead of just deploying our pods into the default namespace, we can also deploy our pods into targeted namespaces.

## Task

For this task we will be using the `manifest` namespace. 

>**Note** If this namespace has been deleted, run `kubectl create namespace manifest`{{execute}} to create it again.

## Kubectl
To begin with, we can check which pods are running in this namespace by running `kubectl get pods -n manifest`{{execute}}. You should see that we do not have any pods in this namespace yet.

To create a new pod named `http` using the `katacoda/docker-http-server:latest` image within the `manifest` namespace we can run. 
`kubectl run --generator=run-pod/v1 http --image=katacoda/docker-http-server:latest -n manifest`{{execute}}

### Validation
Let's have a look at the pods running in `manifest` namespace:

`kubectl get pods -n manifest`{{execute}}

You should see the `http` pod is running in the `manifest` namespace.

## YAML manifest

We can similarly create a YAML manifest to create our new pod.

To help with keeping our pods organised. We can also add labels to our pods. 

In the YAML below, we can note that the difference between our previous YAML file in the previous scenario.

We can see the addition of `labels` to help us group related pods as well as the `namespace` section where we can indicate the namespace we wish to have our pod deployed into.

<pre class="file"
data-filename="pod-namespace.yaml"
data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: redis
  namespace: manifest
  labels: 
    app: redis
    segment: backend
    company: mycompany    
spec:
  containers:
  - name: redis
    image: redis:4.0.10
    ports:
    - name: redisport
      containerPort: 6379
      protocol: TCP</pre>
      
If the file doesn't open click here `pod-namespace.yaml`{{open}}

To create the pod using the manifest we can then run the following command as usual:

`kubectl apply -f pod-namespace.yaml`{{execute}}
      
We can then check to see that the `redis` pod has been created by running `kubectl get pods -n manifest`{{execute}}
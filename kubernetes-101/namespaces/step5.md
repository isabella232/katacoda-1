Instead of just deploying our pods into the default namespace, we can also deploy our pods into targeted namespaces.

## Task

For this task we will be using the `manifest` namespace. If this namespace has been deleted, run `kubectl create namespace manifest`{{execute}} to create it again.

To begin with, we can check which pods are running in this namespace by running `kubectl get pods -n manifest`{{execute}}. You should see that we do not have any pods in this namespace yet.

To create a new pod named `http` using the `katacoda/docker-http-server:latest` image within the `manifest` namespace we can run. 
`kubectl run --generator=run-pod/v1 http --image=katacoda/docker-http-server:latest -n manifest`{{execute}}

### Validation
Let's have a look at the pods running in `manifest` namespace:

`kubectl get pods -n manifest`{{execute}}

Great! The `http` pod is running in the `manifest` namespace!
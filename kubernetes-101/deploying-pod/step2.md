Task
The following command will launch a deployment called http which will start a container based on the Docker Image.

`kubectl run --generator=run-pod/v1 http --image=katacoda/docker-http-server:latest`{{execute}}

You can then use kubectl to view the status of the pod

`kubectl get pods`{{execute}}

To find out what Kubernetes created you can describe the deployment process.

`kubectl describe pod http`{{execute}}

The description includes how many replicas are available, labels specified and the events associated with the deployment. These events will highlight any problems and errors that might have occurred.

In the next step we'll expose the running service.


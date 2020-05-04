In this section we will show you how to access the logs for a particular pod and how to tidy up and delete your deployments.

# Viewing a Pod's logs

On many occasions it will be useful to view the logs of the pods running.

## Task

First, check your pod is running by running `kubectl get pods`{{execute}}. To access the logs for a particular pod (e.g. http) we can run the following code `kubectl logs http`{{execute}}.

You should see an initial log showing `Web Server started. Listening on 0.0.0.0:80`

We will show more details later on how to access this pod externally.

### Exercise 1 - Accessing pod logs

Try to access the logs for the **http-yaml** pod. You should see a similar output.

# Deleting a pod

We will now discuss how to delete pods once we have finished with resources.

## Delete a single pod

First, check the list of pods by running `kubectl get pods`{{execute}}.

We can then delete each of the pods in two ways.

### Kubectl CLI

We can delete a pod one by one by running `kubectl delete pod pod-name`. For our http server we can do this by running `kubectl delete pod http`{{execute}}.

### Yaml file

We can delete a pod based on the yaml file by running `kubectl delete -f http-pod.yaml`{{execute}}

> **Note**: This file must be unchanged and have the same pod name otherwise it will not know which pod to delete.

You should get a console log saying `pod "http" deleted`

### Exercise 2 - Deleting a pod

Try to delete the **http-yaml** pod.

## Deleting all pods

> **NOTE** Whilst this is useful in training scenarios, this can cause issues when in production where pods may be inadvertently deleted.

We can also delete all the pods by running `kubectl delete pods --all`{{execute}}.

### Exercise 3

Ensure all pods are deleted before moving forwards, either by deleting one by one or by deleting all pods in 1 command.

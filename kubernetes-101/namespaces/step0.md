Minikube has been pre-installed and configured in this katacoda environment. Check that it is properly installed, by running the minikube version command:

Minikube will complete it's installation setup and will display `Done! kubectl is now configured to use "minikube"` once it is completed.

`minikube version`{{execute}}

Check the cluster is up and running by running the command:

`kubectl get nodes`{{execute}}

Great! You now have a running Kubernetes cluster in your online terminal. Minikube started a virtual machine for you, and a Kubernetes cluster is now running in that VM.
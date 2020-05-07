First let's start our cluster:

`minikube start --wait=false`{{execute}}

And let's deploy our app:

`kubectl apply -f web-svr.yaml`{{execute}}

Let's check the status of our pods and wait until they are created. If you're not sure how to do this you'll want to run: 

`kubectl get pods`{{execute}}

This should show you that all is not quite right with your application, its been deployed it starts to run but after a few seconds it restarts, it does this a few times before it enters the dreaded **CrashLoopBackOff** state. If you want to watch the restart count increase run:

`watch -n 1 kubectl get pods`{{execute}}

To stop watching focus the terminal and press `CTRL + c`

Your challenge is now to find out why your application is restarting and fix it. Step 2 will help you diagnose the problem, step 3 will help you to resolve it.

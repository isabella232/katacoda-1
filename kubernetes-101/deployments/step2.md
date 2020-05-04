# ReplicaSets

In your first exercise you run a pod in the cluster, what happens when you actually want to run multiple pods?

Run `kubectl run http --image=nginx:1.14.2` multiple times?

Of course not, we use **ReplicaSets**, a **ReplicaSet** holds a template of the pod and the number of replicas we  want to run. 


In this example we already provide a **ReplicaSet** yaml file with the exercise, take your time to look at it

`cat replicaset.yaml`{{execute}}

To create the **ReplicaSet** we need to apply the yaml file

`kubectl apply -f replicaset.yaml`{{execute}}

Check that the **ReplicaSet** is running

`kubectl get rs`{{execute}}

You can get more info about the **ReplicaSet** by running the describe command on it

`kubectl describe rs my-nginx-replicaset`{{execute}}

Check that we have 3 pods running

`kubectl get pods`{{execute}}

Try killing the first pod on the list

`kubectl delete $(kubectl get pods -o name | head -n 1)`{{execute}}

Get the pods again, you should see that a new one as been created

`kubectl get pods`{{execute}}

Let's clean up 

`kubectl delete rs my-nginx-replicaset`{{execute}}

You should see our pods being terminated automatically

`kubectl get pods`{{execute}}

# Deployments

We have seen that **ReplicaSets** allows us to scale our pods horizontally, but probably you won't ever going to manipulate **ReplicaSets** again. The reason for this is that we have a higher order concept for dealing with horizontal scaling, yep **Deployments**

**Deployments** manage **ReplicaSets** for us, they allow us to rollout new versions of our app, (perform) rollback to a previous version or rolling updates to our pod templates

We can apply a yaml file like we did for the **ReplicaSet** or we can run a **kubectl** command

**NOTE**:
Because we are using the latest version of kubernetes using the command `run` to create **Deployments** has been deprecated

`kubectl run nginx-deployment --image=nginx --replicas=3`

Instead we need to run the new shiny command `create`

`kubectl create deployment nginx-deployment --image=nginx:1.14.2`

The new command doesn't allow us to pass the number of replicas we want, so we have two options:

Do a dry run, generate a yaml file and edit the file:

`kubectl create deployment nginx-deployment --image=nginx:1.14.2 --dry-run -o=yaml | sed 's/replicas: 1/replicas: 3/g' >> deployment.yaml`{{execute}}

After that we can apply:

`kubectl apply -f deployment.yaml`

Or we can run the create command and create a deployment with one replica

`kubectl create deployment nginx-deployment --image=nginx:1.14.2`{{execute}}

And then scale the deployment's replicas to 3:

`kubectl scale --replicas=3 deployment/nginx-deployment`{{execute}}

Both options are valid.

Check that you have created all the resources. You should have 3 **Pods**, 1 **Deployment** and 1 **ReplicaSet**

`kubectl get pods`{{execute}}

`kubectl get deployments`{{execute}}

`kubectl get replicasets`{{execute}}

# Rollout Deployments

So far deployments don'}t seem very different than **ReplicaSets** let's do a rollout of a different version.

Before we proceed we can check the status and history of our deployments by running the following commands

`kubectl rollout history deployment/nginx-deployment`{{execute}}

And: 

`kubectl rollout status deployment/nginx-deployment`{{execute}}


Let's update our **Deployment** to run nginx 1.16.

`kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1 --record`{{execute}}

Check your **ReplicaSets**:

`kubectl get replicasets`{{execute}}

You should see two **ReplicaSets** why? Our deployment behind the scenes has changed our current **ReplicaSet** to 0 replicas and created a new **ReplicaSet** with the new nginx version and desired 3

Let's check if our deployements was succesfull:

`kubectl rollout status deploymet/nginx-deployment`{{execute}}

You should also see that we have a new `rollout` history:

`kubectl rollout status deploymet/nginx-deployment`{{execute}

Let's revert our deployment, it turns out we prefer nginx 1.14.2

`kubectl rollout undo deployment/nginx-deployment`

Check the status of your deployment:

`kubectl rollout status deployment/nginx-deployment`{{execute}}

Check your pods, see that they have recently been created:

`kubectl get pods`{{execute}}

Confirm that they are running the correct version of nginx

`kubectl desribe $(kubectl get pods -o name | head -n 1)`{{execute}}

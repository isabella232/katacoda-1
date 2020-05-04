To practice what we have learnt we have created a set of exercises to help practice

To begin with, we need to set up our replication controller **exercise-nginx** which is in the `rc-exercise.yaml`{{open}} file by running `kubectl apply -f rc-exercise.yaml`{{execute}}.

**Exercise 1** 

Expose the deployment as a service with the following specifications:

* **type**: LoadBalancer
* **target-port**: 80 
* **port**: 5678
* **name**: exercise-service

> Solution
>Run `kubectl expose rc exercise-nginx --port=5678 --target-port=80 --name=exercise-service --type=LoadBalancer`{{execute}}
>
> It can also be done by creating a yaml file called `yaml-exercise.yaml`{{open}} with the following specification
<pre class="file"
 data-filename="yaml-exercise.yaml"
 data-target="replace">
apiVersion: v1
kind: Service
metadata:
  name: exercise-service
spec:
  selector:
    app: exercise
  ports:
  - port: 5678
    targetPort: 80
type: LoadBalancer</pre>
It can then be run by running `kubectl apply -f yaml-exercise.yaml`{{execute}}

In order to get access to the ip for our new load balancer we can run `export LoadBalancerExerciseIP=$(kubectl get services/exercise-service -o jsonpath='{.spec.clusterIP}')`{{execute}}.

To check the IP address we can run `echo LoadBalancerExerciseIP=$LoadBalancerExerciseIP`{{execute}} and can access the apps by running `curl $LoadBalancerExerciseIP:5678`{{execute}}

We should see `<h1>This request was processed by host: exercise-nginx-4vfzj</h1>`
(where the host is replaced by your pod names) returned.

We should see that each time we **curl** the server we can see that it balances the load across the apps to distribute the workload.
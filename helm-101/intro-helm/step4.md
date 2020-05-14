# Helm charts part II
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">


Probably you might be wondering, how is this different from native **kubernetes deployments**?

In our previous example we deployed a simple chart with one pod, let's do something more complex. In fact let's go crazy and create our own chart!

We will be covering some concepts, but to get the full grasp nothing better than reading the [documentation](https://v2.helm.sh/docs/charts/#charts)

`helm create the-chart`{{execute}}

This will create a folder with the name **the-chart** have a look at the files either using the editor, or the terminal.

> If the files do not appear in the editor, click the <i class="fas fa-sync-alt"></i> icon in the top left and the files should appear

The most important bit is the templates folder. In there you will find some default templates with what looks like some sort of template placeholders. Behind the scenes **Helm** uses [go template](https://golang.org/pkg/text/template/).

The files should look familiar they are templates of **kubernetes** resources, in there you can find some default values. You can start seeing why **Helm** is so powerful, imagine an organisation with multiple services, all of them are **http microservices**, you can easily provide a chart with a bunch of defaults and allow each team/microservice provide their values. 

You can find the default values in (surprise!!) **values.yaml**

To overwrite these values we can either pass a **yaml** file with the flag `--values` or we can overwrite directly from the command line:

`helm install --dry-run --debug ./the-chart --set service.internalPort=8080,replicaCount=2`{{execute}}


Let's add a dependency to our chart:

```
echo "dependencies:
- name: mongodb-replicaset
  version: 3.15.0 # chart version not mongodb version
  repository: https://kubernetes-charts.storage.googleapis.com"> ./the-chart/requirements.yaml
```{{execute}}

We now need to update our chart:

`helm dep update ./the-chart`{{execute}}

And now we are ready to deploy our entire stack:

`helm install ./the-chart --set replicaCount=2 --namespace=databases`{{execute}}

Take a moment to check what has been installed. First we can check that we have actually deployed our custom chart:

`helm ls`{{execute}}

Then we can have a look at our pods, we should see two **the-chart** pods, three **mongodb** and our previous **mysql** pod.

`kubectl get pods`{{execute}}

We should have services deployed as well

`kubectl get services`{{execute}}

And a service account:

`kubectl get serviceaccounts`{{execute}}

> **Note:** it may take a minute or so to install and set up our resources so if they don't appear at first wait a few seconds and run the commands again.

We can test that our mongo deployment is running by selecting one of our `replica-set` pods (e.g. `vocal-lightningbug-mongodb-replicaset-0` in our case) and get it's IP address by running `kubectl get pods -o wide`{{execute}}.

By default mongodb runs on port `27017`. We can run the following command to test it is working.

`curl <NODE-IP>:27017` (in our case `curl 172.18.0.8:27017`).

and should receive the following response 

`It looks like you are trying to access MongoDB over HTTP on the native driver port.`

### Summary

We just deployed our app plus, a **service**, a **service account** and a **database** as one atomic piece. Reverting, updating or deleting our helm release will be managed through its CLI as a single cohesive unit.

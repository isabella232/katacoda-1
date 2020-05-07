# Helm charts part II

Probably you might be wondering, how is this different from native **kubernetes deployments**?

In our previous example we deployed a simple chart with one pod, let's do something more complex. In fact let's go crazy and create our own chart!

We will be covering some concepts, but to get the full grasp nothing better than reading the [documentation](https://v2.helm.sh/docs/charts/#charts)

`helm create the-chart`{{execute}}

This will create a folder with the name **the-chart** have a look at the files either using the editor, or the terminal.

The most important bit is the templates folder. In there you will find some default templates with what looks like some sort of template placeholders. Behind the scenes **Helm** uses [go template](https://golang.org/pkg/text/template/).

The files should look familiar they are templates of **kubernetes** resources, in there you can find some default values. You can start seeing why **Helm** is so powerful, imagine an organisation with multiple services, all of them are **http microservices**, you can easily provide a chart with a bunch of defaults and allow each team/microservice provide their values. 

You can find the default values in (surprise!!) **values.yaml**

To overwrite these values we can either pass a **yaml** file with the flag `--values` or we can overwrite directly from the command line:

`helm install --dry-run --debug ./thechart --set service.internalPort=8080,replicaCount=2`{{execute}}


Let's add a dependency to our chart:

`cat > ./thechart/requirements.yaml <<EOF
dependencies:
- name: mongodb-replicaset
  version: 3.15.0 # chart version not mongodb version
  repository: https://kubernetes-charts.storage.googleapis.com
EOF`{{execute}}


We now need to update our chart:

`help dep update ./thechart`{{execute}}

And now we are ready to deploy our entire stack:

`helm install ./thechart --set replicaCount=2 --namespace=databases`{{execute}}

Take a moment to check what has been installed. First we can check that we have actually deployed our custom chart:

`helm ls`{{execute}}

Then we can have a look at our pods, we should see two **thechart** pods, three **mongodb** and our previous **mysql** pod.

`kubectl get pods`{{execute}}

We should have services deployed as well

`kubectl get services`{{execute}}

And a service account:

`kubectl get serviceaccounts`{{execute}}

We just deployed our app plus, a **service**, a **service account** and a database as one atomic piece, so reverting, updating or deleting our helm deployment

We just deployed our app plus, a **service**, a **service account** and a **database** as one atomic piece. Reverting, updating or deleting our helm release will be managed through its CLI as a single cohesive unit.

# Helm charts part I

To give you some context here's the official explanation of what are **Helm charts**


> Helm uses a packaging format called charts. A chart is a collection of files that describe a related set of Kubernetes resources. A single chart might be used to deploy something simple, like a memcached pod, or something complex, like a full web app stack with HTTP servers, databases, caches, and so on.
> 
> Charts are created as files laid out in a particular directory tree, then they can be packaged into versioned archives to be deployed.

Here's the link to the official [documentation]( https://v2.helm.sh/docs/charts/#charts ).

A simplified way of thinking about it is, **Helm charts** are packages (one or multiple dependencies) that are stored in a repository (**charts** repository).

There's the official **helm charts repository** the [Hub Helm](https://hub.helm.sh/) in here you will find most of the official charts for open source tools and technologies (redis, mysql, nginx, etc.).

###Let's deploy our first chart!


Let's first create a new namespace:
`kubectl create namespace databases`{{execute}}

We can search for charts in the official repository:

`helm search stable/mysql`{{execute}}

We can also list what versions are available, using the `-l` or `--versions`:

`helm search stable/mysql --versions`{{execute}}

**Note** that we can see two versions listed, the **mysql** version and the **helm chart** version.
You can read more about the search command and it's options [here](https://v2.helm.sh/docs/helm/#helm-search)

We want to install **mysql 5.7.27** for that we have to use the **helm chart 1.6.1**:

`helm install stable/mysql --version 1.6.1 --name=mysql-dev --namespace=databases`{{execute}}

We have also provided a name to our deploy and the namespace where we want it to be deployed.


Check that the pod was deployed:

`kubectl get pods`{{execute}}


You should see that the pod was deployed.
But instead there's nothing. That's because we are currently looking in the **default namespace**:

`kubectl get pods --namespace databases`{{execute}}

If you want you can set the namespace to **databases** in our current **context**, so you don't have to pass it every single time:

`kubectl config set-context --current --namespace=databases`{{execute}}

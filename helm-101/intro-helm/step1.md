# Installing Helm


First, let's start our cluster:

`minikube start --wait=false`{{execute}}

For this exercise we already provide the **tar** file. But installing **Helm** is quite easy, find the version you want to install from the [releases page](https://github.com/helm/helm/releases) and download the binary.

Check that it has been uploaded, you should see a tar file:
`ls -la`{{execute}}

If you can't see the file give it a few seconds, katacoda should be uploading it.

Let's unpack it:

`tar -zxvf helm-v2.16.6-linux-amd64.tar.gz`{{execute}}

And move to a folder in our `$PATH`
 
`mv linux-amd64/helm /usr/local/bin/helm`{{execute}}

Now that we have Helm installed we need to initialise it. This will install **tiller** on our cluster using our current context (minikube) and namespace(by default helm installs on **kube-system**)

`helm init`{{execute}}

You should see a new **tiller-deploy** pod:

`kubectl get pods --namespace kube-system`{{execute}}

We're almost done, we need to run a couple more commands, so Tiller has enough permissions to deploy our charts.
The following commands are a bit more advanced and touch on something we haven't explained. If you find them too confusing, ignore the explanation and apply them.

We need to create a new **service account**, in this case, we named it **my-tiller-svc**:

`kubectl -n kube-system create serviceaccount my-tiller-svc`{{execute}}

We then give permissions cluster wide to **my-tiller-svc** our service account :

`kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:my-tiller-svc`{{execute}}

Last but not least, we patch our current tiller-deploy to use our new service account:

`kubectl -n kube-system patch deploy tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"my-tiller-svc"}}}}'`{{execute}}


A couple of notes, in this specific case we are using the default configurations for Helm. We are also giving wide cluster admin permissions. As you might guess this is not a proper way to set up **Helm**, in any shared environment with multiple users. Securing **Helm** installation is out of the scope of this scenario. If you do want to read more about securing **Helm** make sure you read about how **kubernetes** [RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) works, and then [securing helm](https://v2.helm.sh/docs/using_helm/#securing-your-helm-installation).

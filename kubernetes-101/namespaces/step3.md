We can often need to tidy up our namespaces on occassions.

##Delete a Namespace:
To delete a namespace there are two options, we can use a yaml file or a single command:
### Kubectl CLI

To delete a namespace via the CLI we can run `kubectl delete namespace kubernetes-101`{{execute}} to delete our `kubernetes-101` namespace.

### Yaml Manifest
>**Note** For this to work the yaml file must be unchanged from teh original namespace that was created or it would not be able to delete properly

This can be done by running
`kubectl delete -f namespace.yaml`{{execute}}

### Verification

You can verify that the namespaces have been deleted by running `kubectl get namespaces`{{execute}}
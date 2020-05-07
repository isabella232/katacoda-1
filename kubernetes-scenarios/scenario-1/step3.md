We can patch the deployment, roll it out again or edit on the fly. In an ideal world we'd update the manifest, get some form of approval for the change and then roll it out. For the purpose of this demo we will be going to patch the deployment using **kubectl**

The quickest and easiest way to fix this is to run **kubectl** edit deployment **web-svr**, the danger with this is it leaves you open to editing a lot more than just the problematic liveness probe. An alternative that allows for a little extra control is to patch the deployment.

Open the **patch.yaml** on the editor and copy these contents to the file:

<pre class="file"
data-filename="patch.yaml"
data-target="replace">
spec:
  template:
    spec:
      containers:
      - name: web-svr
        livenessProbe:
          httpGet:
            path: /healthz</pre>

Now run the following:

`kubectl patch deployment web-svr --patch "$(cat patch.yaml)"`{{execute}}

Doing it via this patch file means we are only going to be changing the liveness probe for the **web-svr** container.

Let's confirm that everything is fine:

`watch -n 1 kubectl get pods`{{execute}}

Congratulations, your pod should now be fit and healthy.

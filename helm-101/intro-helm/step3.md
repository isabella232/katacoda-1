# Helm deploys

Now that we have deployed our first chart, there's a couple of things we can do.

We can list our helm deployments:

`helm ls`{{execute}}

We can upgrade our deployment to the latest version of the **chart**:

`helm upgrade mysql-dev stable/mysql`{{execute}}

We should see a new revision:

`helm ls`{{execute}}

We can also rollback to a specific revision:

`helm rollback mysql-dev 1`{{execute}}

This will add another revision:

`helm ls`{{execute}}

What this means is that you can actually rollback the rollback:

`helm rollback mysql-dev 2`{{execute}}

Back to our latest version of the chart

`helm ls`{{execute}}


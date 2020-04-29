Let's practice!

1. Create namespace: lab1

2. Create a pod using the kubectl CLI with the following constraints.

* **Pod name**: happymonkey
* **Namespace**: lab1
* **Container Image**: jenkins:latest

Check `happymonkey` is running successfully

3. Create a pod using the yaml mainfest with the following constraints:

* **File name**: `lab.yaml`{{open}}
* **Pod name**: happyelephant
* **Namespace**: lab1
* **Container Image**: jenkins:latest
* Add 3 labels
* Set the container with 8080 port

You can use the `pod-namespace.yaml`{{open}} file as an example to help

Check `happyelephant` is running successfully
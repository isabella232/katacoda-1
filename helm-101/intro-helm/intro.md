# Helm and Helm charts

This scenario takes you through the basics of **Helm** and **Helm charts**. 

There's two binaries The Helm client (**helm**) and the Helm server (**tiller**). The **helm** client we run on our terminal, **tiller** is a pod that will be on our cluster. 

- to install a **Helm**
- to deploy **Tiller** to the **kube-system namespace**
- to deploy a community **Helm chart**
- to deploy a custom **Helm chart** 

**Note:**

**Helm** has released a new major version (v3.0.0) that doesn't depend on **tiller** to manage and deploy **Helm charts**. In this scenario we will be using **Helm v2**

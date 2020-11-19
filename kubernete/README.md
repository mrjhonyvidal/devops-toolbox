### What is Kubernetes
System for running many different containers over multiple different machines

### Why use it?
When you need to run many different containers with different images

### Working with kubernetes
Development: using minikube (command line tool to set Kubernetes on local machine)
Production: 
    - Amazon Elastic Container Service for Kubernetes (EKS)
    - Google Cloud Kubernetes Engine (GKE)
    - On Premise 
    
Typical Architecture

```
 -----------------------Request-------------------------
                            |
                            |
                     Load Balancer
                            |
                            |
           --------------------------------------
           |                |                   |             
        Node                Node                 Node
       (ContainerA)         (Container)         (ContainerD)
       (ContainerB)                             (ContainerE)   
                                                (ContainerF)
    ---------------------------------------------------------------                                                     
                        Controller by
                     MASTER NODE: Controls what each node does
                     - Nodes + Master form a 'Cluster'   
```

```                         
                                                                    |------------------------|    
 Use for managing containers in the node: kubectl ----------------> | Virtual Machine (Node) |
 (Used on both local or production environment)                     |                        |
                                                                    |                        |
 Use for managing the VM itself: minikube         ----------------> | (Container)            |
 (Use to create Kubernete cluston on local machine)                 | (Container)            |
                                                                    |------------------------|
```
Setting Local environment
- [X] Install Kubctl (CLI for interacting with master node)
- [X] Install a VM driver (virtualbox) Used to make a VM that will be your single node
- [X] Install Minikube (Runs a single node on that VM)

```
brew install minikube
brew install kubectl
``` 

Running Minikube on terminal

```
minikube start
minikube start --vm-driver hyperv/virtualbox
minikube status

Going to see something like this:
😄  minikube v1.12.1 on Darwin 10.14.6
✨  Automatically selected the docker driver. Other choices: hyperkit, virtualbox
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.18.3 preload ...
    > preloaded-images-k8s-v4-v1.18.3-docker-overlay2-amd64.tar.lz4: 526.27 MiB
🔥  Creating docker container (CPUs=2, Memory=4000MB) ...
🐳  Preparing Kubernetes v1.18.3 on Docker 19.03.2 ...
🔎  Verifying Kubernetes components...
🌟  Enabled addons: default-storageclass, storage-provisioner
🏄  Done! kubectl is now configured to use "minikube"
❗  /usr/local/bin/kubectl is version 1.16.6-beta.0, which may be incompatible with Kubernetes 1.18.3.
💡  You can also use 'minikube kubectl -- get pods' to invoke a matching version
```

Running our app
Deploy our React app, using minikube we would visit:

192.168.99.101:31515

Instead, when using Docker Desktop's Kubernetes, we would visit: localhost:31515
```


```


Checking kubectl version
```
kubectl cluster-info

Kubernetes master is running at https://127.0.0.1:32768
KubeDNS is running at https://127.0.0.1:32768/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

kubectl version --client
Client Version: version.Info{Major:"1", Minor:"16+", GitVersion:"v1.16.6-beta.0", GitCommit:"aaaaaaa", GitTreeState:"clean", BuildDate:"2020-01-15T08:26:26Z", GoVersion:"go1.13.5", Compiler:"gc", Platform:"darwin/amd64"}
```

#### References
https://kubernetes.io/docs/tasks/tools/install-minikube/
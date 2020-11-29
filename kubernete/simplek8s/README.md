# Simple React App using Kubernetes

#### Running our app
Deploy our React app, using minikube we would visit: `192.168.99.101:31515`
When using Docker Desktop's Kubernetes, please visit: `localhost:31515`

Specify a new vm driver instead of none, that would be work. On mac:

minikube start --vm-driver=hyperkit

```
minikube delete
minikube start --vm-driver=hyperkit
kubectl apply -f client-pod.yaml 
kubectl apply -f client-node-port.yaml
kubectl get pods
minikube ip --> print the IP of the Kubernetes Node VM running your pods
Go to http://IP_RETURNED_FROM_MINIKUBE:31515/
```
kubectl: CLI we use to change our kubernetes cluster

apply: Change the current configuration of cluster

-f: Specify the file that has the config changes

<filename>: Path to the file with the config

get: Retrieve information about a running object

pods: the object type we want information

#### Object Types
- pods (Runs one or more closely related containers)
- Services (set up networking in Kubernetes Cluster)
    - ClusterIP
    - NodePort -> Exposes a container to outside world(only good for dev purposes!!!)
    - LoadBalancer
    - Ingress 

### TODO
1. Kubernetes expects all images to already be built 
- ( simple container running on our local Kubernetes cluster) Make sure our image is hosted on docker hub. 

2. One config file per object we want to create -> Make
- ( local cluster) Make one config to create the container

3. We have to manually set up all networking 
- (local cluster) Make one config to set up networking 


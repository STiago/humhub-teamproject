# Solution 3 - Kubernetes 
=========================

Deployment with Kubernetes.

The main commands to use for creating, removing and checking the status of the deployment are the following commands:

$ kubectl apply -f humhub-deployment.yaml
$ kubectl delete deployment humhub
$ kubectl get pods
$ kubectl describe pod humhub-8565d97c88-h9fqm
$ kubectl get deployments 


For the deployments you just need to run the command `kubectl apply -f humhub-deployment.yaml`, then you can check the deployments and the pods:

![Check_pod](https://github.com/STiago/Pictures/blob/master/humhub/get_pods.png)

![Describe_pod](https://github.com/STiago/Pictures/blob/master/humhub/describe_pods.png)


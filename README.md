# go_http_server

goとかk8sとかamazon eksの練習

## Service Deployment
```
eksctl create cluster -f amd64-cluster.yaml
kubectl apply -R -f k8s/
```

## Release resources
```
eksctl get cluster
eksctl delete cluster --wait --name=amd64-cluster.yaml
```

# trio's Auto-Scaling App

## Description
This project demonstrates how to automate deployment, scaling, and load balancing using Docker, Kubernetes, Jenkins, NGINX Ingress, and Terraform.

## Run Locally
```
docker build -t trio-app .
docker run -p 5000:5000 trio-app
```

## Deploy to Kubernetes
```
kubectl apply -f k8s/
```

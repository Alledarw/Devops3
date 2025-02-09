# How to use

This repository contains a simple Nginx-based web application containerized with Docker and deployed using Kubernetes. The Docker images are publicly available and can be pulled from GitHub Container Registry (GHCR).

## Prerequisites

Before you begin, ensure you have the following installed:

- Docker
- Kubernetes (Minikube, Docker Desktop, or a Kubernetes cluster)
- kubectl (Kubernetes CLI)
- Ansible
- Python 3.x 

Additionally, the repository assumes you're using a Docker container image that you manage via GitHub Packages or another container registry.

## Setup

1. **Clone the repository**

```bash
git clone https://github.com/Alledarw/Devops3.git 

```

2. **Open the folder with code editor**

```bash
cd Devops3
code .

```

3. **Install dependencies**

```bash
- Docker
- Kubernetes (Minikube, Docker Desktop, or a Kubernetes cluster)
- kubectl (Kubernetes CLI)
- Ansible
- Python 3.x 

```
4. **Deploy to Kubernetes**

```bash
minikube start
kubectl apply -f k8s/k8s-deployment.yml
kubectl apply -f k8s/k8s-service.yml

```
Check so it's working by running: kubectl get pods and kubectl get deployments

5. **Expose service with Minikube**
```bash
minikube service web-server-nginx-service --url

```
Follow the link provided to display the index.html in your browser or use minikube ip. Example: http://<minikube-ip>:<node-port>

5. **Automating with Ansible**
```bash
ansible-playbook ansible/rolling_update.yml

```
Run the playbook to update the current pod image to a new one. 
To try the rolling update and rollback feature play around with the image_version and new_image_version.
Right now it's set to try to update to v1.3.0 which dosen't exist, triggering the rollback.

## CI/CD Pipeline

This project uses GitHub Actions to:

    Build and push the Docker image to GHCR.
    Trigger the pipeline on annotated Git tags.
    Ensure no cached layers are used during build.

To trigger the pipeline, create and push an annotated tag:
```bash
git tag v1.3.0 -m "New version"
git push origin v1.2.1

```
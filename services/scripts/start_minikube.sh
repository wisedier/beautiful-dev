#/bin/bash

minikube start \
    --vm-driver=virtualbox \
    --cpus=6 --memory=28672 --disk-size=384 \
    --mount
minikube mount /storage:/storage > /dev/null 2>&1 &
minikube mount /data:/opt/data > /dev/null 2>&1 &
eval $(minikube docker-env)

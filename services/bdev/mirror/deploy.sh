#!/bin/bash

kubectl create namespace bdev -o yaml --dry-run | kubectl apply -f -
kubectl create configmap mirror-nginx-config \
    -n bdev \
    --from-file=nginx-default.conf \
    -o -yaml \
    --dry-run \
    | kubectl apply -f -
kubectl apply -f mirror-svc-deploy.yaml
kubectl apply -f ingress.yaml

#!/bin/bash

kubectl port-forward \
    deployment.apps/gitlab-gitlab-shell \
    --address 0.0.0.0 8022:2222 \
    -n bdev &

sudo kubectl port-forward \
    deployment.apps/nginx-ingress-controller \
    --address 0.0.0.0 80:80 443:443
    -n kube-system

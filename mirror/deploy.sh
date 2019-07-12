#!/bin/bash
BASEDIR=$(dirname $(realpath "$0"))

kubectl -n bdev delete --ignore-not-found=true svc mirror 
kubectl -n bdev delete --ignore-not-found=true deploy mirror 

kubectl create -f $BASEDIR/mirror.yaml
kubectl get pods -n bdev -l app=mirror

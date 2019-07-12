#!/bin/bash
BASEDIR=$(dirname $(realpath "$0"))

echo -e "Deleting previous version of Gitlab if it exists"
kubectl delete --ignore-not-found=true svc,pvc,deployment -l app=gitlab -n bdev
kubectl delete --ignore-not-found=true -f $BASEDIR/local-volumes.yaml -n bdev

echo -e "Creating pods"
kubectl create -f $BASEDIR/local-volumes.yaml
kubectl create -f $BASEDIR/postgres.yaml
kubectl create -f $BASEDIR/redis.yaml
kubectl create -f $BASEDIR/gitlab.yaml
kubectl get svc gitlab -n bdev

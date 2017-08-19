#!/usr/bin/env bash

########################
# include the magic
########################
. ./demo-magic.sh

clear 

DEMO_PROMPT="localadmin@k8s-master$"






kubectl delete -f demos/network_policy-be.yml -n vmworld
kubectl delete -f demos/network_policy-fe.yml -n vmworld
kubectl delete -n vmworld -f demos/redis.yml
kubectl delete -f demos/ingress.yml -n vmworld
kubectl delete -n vmworld -f demos/frontend.yml

pe "watch kubectl get all -n vmworld -o wide"

pe "kubectl delete ns vmworld"

pe "kubectl get namespaces"






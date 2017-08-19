#!/usr/bin/env bash

########################
# include the magic
########################
. ./demo-magic.sh

clear 

DEMO_PROMPT="localadmin@k8s-master$"

pe "kubectl get nodes"
pe "kubectl get all -o wide"

pe "kubectl get namespaces"
pe "kubectl create ns vmworld"
pe "vimcat demos/frontend.yml"
pe "kubectl create -n vmworld -f demos/frontend.yml"
pe "watch kubectl get all -n vmworld -o wide"
pe "kubectl scale deploy/frontend --replicas=4 -n vmworld"
pe "kubectl get pods -o wide -n vmworld"
pe "kubectl create -f demos/ingress.yml -n vmworld"
pe "vimcat demos/ingress.yml"
pe "vimcat demos/redis.yml"
pe "kubectl create -n vmworld -f demos/redis.yml"
pe "watch kubectl get all -n vmworld -o wide"
pe 'kubectl annotate ns vmworld "net.beta.kubernetes.io/network-policy={\"ingress\": {\"isolation\": \"DefaultDeny\"}}"'
pe "vimcat demos/redis.yml"
pe "kubectl create -f demos/network_policy-fe.yml -n vmworld"
pe "vimcat demos/redis.yml"
pe "kubectl create -f demos/network_policy-be.yml -n vmworld"

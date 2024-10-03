#!/bin/bash
echo "a"
rm $HOME/.ssh/known_hosts
echo "b"
export DISABLE_TELEMETRY=true
DISABLE_TELEMETRY=true k0sctl apply --config k0sctl.yaml
k0sctl kubeconfig > kubeconfig
mkdir -p $HOME/.kube
mv kubeconfig $HOME/.kube/config
chmod 644 $HOME/.kube/config 
sleep 10
kubectl get all -A

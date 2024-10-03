#!/bin/bash
k0sctl reset --config k0sctl.yaml
kubectl get all -A


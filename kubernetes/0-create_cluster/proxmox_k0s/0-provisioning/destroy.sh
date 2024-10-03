#!/bin/bash
terraform init -upgrade
terraform apply -auto-approve -destroy
rm cluster_into.txt

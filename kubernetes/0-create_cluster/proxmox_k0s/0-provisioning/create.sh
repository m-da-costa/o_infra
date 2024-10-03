#!/bin/bash
terraform init -upgrade
terraform apply -auto-approve -parallelism=1
terraform output > cluster_into.txt

#!/bin/bash
rm ~/.ssh/known_hosts
ansible-playbook -i hosts play.yml

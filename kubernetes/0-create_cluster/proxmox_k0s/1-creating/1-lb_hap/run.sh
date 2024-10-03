#!/bin/bash
rm $HOME/.ssh/known_hosts
ansible-playbook -i ../hosts play.yml

#!/bin/bash
rm $HOME/.ssh/known_hosts # I dont remember why I put this here
ansible-playbook -i ../hosts play.yml

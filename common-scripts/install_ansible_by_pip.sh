#!/bin/bash -eu
# @see https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-pip
# @see https://developers.redhat.com/blog/2018/11/14/python-in-rhel-8/
sudo python3 -m pip install --user ansible pexpect
# Because Vagrant can't find ansible
sudo ln -s /root/.local/bin/ansible /usr/bin/ansible
sudo ln -s /root/.local/bin/ansible-config /usr/bin/ansible-config
sudo ln -s /root/.local/bin/ansible-connection /usr/bin/ansible-connection
sudo ln -s /root/.local/bin/ansible-console /usr/bin/ansible-console
sudo ln -s /root/.local/bin/ansible-doc /usr/bin/ansible-doc
sudo ln -s /root/.local/bin/ansible-galaxy /usr/bin/ansible-galaxy
sudo ln -s /root/.local/bin/ansible-inventory /usr/bin/ansible-inventory
sudo ln -s /root/.local/bin/ansible-playbook /usr/bin/ansible-playbook
sudo ln -s /root/.local/bin/ansible-pull /usr/bin/ansible-pull
sudo ln -s /root/.local/bin/ansible-vault /usr/bin/ansible-vault

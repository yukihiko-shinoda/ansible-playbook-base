#!/bin/bash -eu
# This code should be called after installing pyenv and default global Python.
# @see https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-pip
# @see https://developers.redhat.com/blog/2018/11/14/python-in-rhel-8/
sudo bash -lc 'pip install ansible pexpect'

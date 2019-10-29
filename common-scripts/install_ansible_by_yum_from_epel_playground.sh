#!/bin/bash -eu
sudo yum install -y epel-release
sudo yum --enablerepo=epel-playground install -y ansible python3-pexpect
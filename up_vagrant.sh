#!/bin/bash -eu

vagrant halt ${1}
vagrant destroy -f ${1}
vagrant up --provision-with ansible-yum,pip,ansible-yum-absent,ansible-pip,iso,kernel-devel ${1}
set +e
vagrant reload ${1}
set -e
vagrant provision --provision-with playbook,guest-additions ${1}
vagrant reload ${1}

Dotenv.load
Vagrant.configure(2) do |config|
  config.vm.define "6" do |centos_6|
    centos_6.vm.box = "bento/centos-6"
    centos_6.vm.provision "ansible-yum", type: "shell", preserve_order: true, path: "common-scripts/install_ansible_by_sudo_yum_from_epel.sh"
  end

  config.vm.define "7" do |centos_7|
    centos_7.vm.box = "bento/centos-7"
  end

  config.vm.define "8" do |centos_8|
    centos_8.vm.box = "bento/centos-8"
    centos_8.vm.provision "ansible-yum", type: "shell", preserve_order: true, path: "common-scripts/install_ansible_by_sudo_yum_from_epel_playground.sh"
  end

  config.vm.define "a2" do |amazon_linux_2|
    amazon_linux_2.vm.box = "bento/amazonlinux-2"
    amazon_linux_2.vm.box_version = "1.0.0"
  end

  config.vm.box_version = "202002.04.0"
  config.vbguest.no_install = true
  config.vm.synced_folder ".", "/vagrant"
  config.vm.network "public_network", bridge: "Realtek PCIe GBE Family Controller"
  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
  end

  config.vm.provision "ansible-yum", type: "shell", path: "common-scripts/install_ansible_by_sudo_yum.sh"
  config.vm.provision "pip", type: "ansible_local" do |ansible|
    ansible.install           = false
    ansible.inventory_path    = "inventories/box"
    ansible.limit             = "all"
    ansible.playbook          = "playbook.yml"
    ansible.tags              = "pip"
    ansible.verbose           = "vvv"
  end
  config.vm.provision "ansible-yum-absent", type: "shell", path: "common-scripts/uninstall_ansible_by_sudo_yum.sh"
  config.vm.provision "ansible-pip", type: "shell", path: "common-scripts/install_ansible_by_sudo_pip.sh"

  config.vm.provision "iso", type: "file", source: "C:\\Program Files\\Oracle\\VirtualBox/VBoxGuestAdditions.iso", destination: "/home/vagrant/VBoxGuestAdditions.iso"
  config.vm.provision "kernel-devel", type: "ansible_local" do |ansible|
    ansible.install           = false
    ansible.inventory_path    = "inventories/box"
    ansible.limit             = "all"
    ansible.playbook          = "playbook.yml"
    ansible.playbook_command  = "sudo ansible-playbook"
    ansible.tags              = "guest-additions,kernel-devel"
    ansible.verbose           = "vvv"
    ansible.extra_vars        = {
        guest_additions_version_on_host: `vboxmanage --version`.split("r")[0],
        guest_additions_state_absent: true
    }
  end

  config.vm.provision "playbook", type: "file", source: "./", destination: "/tmp/ansible"
  config.vm.provision "guest-additions", type: "ansible_local" do |ansible|
    ansible.install           = false
    ansible.inventory_path    = "inventories/box"
    ansible.limit             = "all"
    ansible.playbook          = "playbook.yml"
    ansible.playbook_command  = "sudo ansible-playbook"
    ansible.tags              = "guest-additions"
    ansible.verbose           = "vvv"
    ansible.provisioning_path = "/tmp/ansible"
  end
end
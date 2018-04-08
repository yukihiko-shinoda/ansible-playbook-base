Dotenv.load
Vagrant.configure(2) do |config|
  config.vm.define "6" do |centos_6|
    centos_6.vm.box = "bento/centos-6"
    config.vm.provision "ansible", type: "shell", inline: " yum install -y epel-release"
  end

  config.vm.define "7" do |centos_7|
    centos_7.vm.box = "bento/centos-7"
  end

  config.vm.box_version = "201803.24.0"
  config.vbguest.no_install = true
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "C:\\Program Files\\Oracle\\VirtualBox", "/VirtualBox"
  config.vm.network "public_network"
  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
  end

  config.vm.provision "ansible", type: "shell", inline: "yum install -y ansible"
  config.vm.provision "iso", type: "shell", inline: "cp -ipf /VirtualBox/VBoxGuestAdditions.iso /home/vagrant/VBoxGuestAdditions.iso"
  config.vm.provision "kernel-devel", type: "ansible_local" do |ansible|
    ansible.inventory_path    = "inventories/common"
    ansible.limit             = "all"
    ansible.playbook          = "playbook.yml"
    ansible.tags              = "kernel-devel"
    ansible.verbose           = "vvv"
    ansible.extra_vars        = {
        guest_additions_version_on_host: `vboxmanage --version`.split("r")[0]
    }
  end

  config.vm.provision "playbook", type: "file", source: "./", destination: "/tmp/ansible"
  config.vm.provision "guest-additions", type: "ansible_local" do |ansible|
    ansible.inventory_path    = "inventories/common"
    ansible.limit             = "all"
    ansible.playbook          = "playbook.yml"
    ansible.tags              = "guest-additions"
    ansible.verbose           = "vvv"
    ansible.provisioning_path = "/tmp/ansible"
  end
end
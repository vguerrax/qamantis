# -*- mode: ruby -*-
# vi: set ft=ruby :

$number_of_nodes = 1
$vm_mem = "1024"
$vb_gui = false
$ansible_install_mode = "pip"
$ansible_version = "2.7.5"
$project_src = "/vagrant/"
$compatibility_mode = "2.0"


# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.require_version ">= 2.0.2"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20190912.0.0"

  (1..$number_of_nodes).each do |i|
    hostname = "ubuntu-%02d" % i

    config.vm.define hostname do |node|
        node.vm.provider "virtualbox" do |vb|
            vb.memory = $vm_mem
            vb.gui = $vb_gui
        end

        ip = "172.19.8.#{i+100}"

        node.vm.network "private_network", ip: ip
        node.vm.network "forwarded_port", guest: 80, host: 8090
        node.vm.network "forwarded_port", guest: 3306, host: 3306

        node.vm.hostname = hostname

        node.vm.synced_folder "./shared", "/vagrant", type: "virtualbox", :mount_options => ["dmode=777","fmode=777"]

        node.vm.provision "install", type: "ansible_local" do |ansible|
          ansible.playbook = "_ansible/install_docker.yml"
          ansible.install_mode = $ansible_install_mode
          ansible.version = $ansible_version
          ansible.compatibility_mode = $compatibility_mode
          ansible.extra_vars = { project_src: $project_src }
        end

        node.vm.provision "start", type: "ansible_local" do |ansible|
          ansible.playbook = "_ansible/start_mantisbt.yml"
          ansible.install_mode = $ansible_install_mode
          ansible.version = $ansible_version
          ansible.compatibility_mode = $compatibility_mode
          ansible.extra_vars = { project_src: $project_src }
        end

        node.vm.provision "stop", type: "ansible_local", run: "never" do |ansible|
          ansible.playbook = "_ansible/stop_mantisbt.yml"
          ansible.install_mode = $ansible_install_mode
          ansible.version = $ansible_version
          ansible.compatibility_mode = $compatibility_mode
          ansible.extra_vars = { project_src: $project_src }
        end

        node.vm.provision "restart", type: "ansible_local", run: "never" do |ansible|
          ansible.playbook = "_ansible/restart_mantisbt.yml"
          ansible.install_mode = $ansible_install_mode
          ansible.version = $ansible_version
          ansible.compatibility_mode = $compatibility_mode
          ansible.extra_vars = { project_src: $project_src }
        end
        
        node.vm.provision "destroy", type: "ansible_local", run: "never" do |ansible|
          ansible.playbook = "_ansible/destroy_mantisbt.yml"
          ansible.install_mode = $ansible_install_mode
          ansible.version = $ansible_version
          ansible.compatibility_mode = $compatibility_mode
          ansible.extra_vars = { project_src: $project_src }
        end
    end
  end
end

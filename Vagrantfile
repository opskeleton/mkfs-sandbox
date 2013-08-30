# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  bridge = ENV['VAGRANT_BRIDGE']
  bridge ||= 'eth0'
  env  = ENV['PUPPET_ENV']
  env ||= 'dev'

  config.vm.define :ubuntu do |ubuntu|
    ubuntu.vm.box = 'ubuntu-13.04_puppet-3.2' 
    ubuntu.vm.network :public_network, :bridge => bridge
    ubuntu.vm.hostname = 'ubuntu.local'

    ubuntu.vm.provider :virtualbox do |vb|
	file_to_disk = './tmp/ubuntu_disk.vdi'
	vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
	vb.customize ['createhd', '--filename', file_to_disk, '--size', 500 * 1024]
	vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
    end

    ubuntu.vm.provision :puppet do |puppet|
	puppet.manifests_path = 'manifests'
	puppet.manifest_file  = 'default.pp'
	puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=#{env}'
    end
  end


  config.vm.define :centos do |centos|
    centos.vm.box = 'centos-6.3_puppet_3' 
    centos.vm.network :public_network, :bridge => bridge
    centos.vm.hostname = 'centos.local'

    centos.vm.provider :virtualbox do |vb|
	file_to_disk = './tmp/centos_disk.vdi'
	vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
	vb.customize ['createhd', '--filename', file_to_disk, '--size', 500 * 1024]
	vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
    end

    centos.vm.provision :puppet do |puppet|
	puppet.manifests_path = 'manifests'
	puppet.manifest_file  = 'default.pp'
	puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=#{env}'
    end
  end
end

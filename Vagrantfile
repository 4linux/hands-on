# -*- mode: ruby -*-
# vi: set ft=ruby :
vms = {

  'centos8' => {'memory' => '1024', 'cpus' => 1, 'ip' => '10', 'ip_int' => '10' , 'box' => 'centos/8', 'provision' => 'centos8.sh'},
  'debian10' => {'memory' => '3072', 'cpus' => 2, 'ip' => '11' , 'box' => 'debian/buster64', 'provision' => 'debian10.sh'}
}

Vagrant.configure('2') do |config|

  config.vm.box_check_update = false

  vms.each do |name, conf|
    config.vm.define "#{name}" do |my|
      my.vm.box = conf['box']
      my.vm.hostname = "#{name}.dexter.com.br"
      my.vm.network 'private_network', ip: "10.23.4.#{conf['ip']}"
      my.vm.provision 'shell', path: "provision/#{conf['provision']}"
      my.vm.provider 'virtualbox' do |vb|
        vb.name = "#{name}"
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
      end
      my.vm.provider 'libvirt' do |lv|
        lv.memory = conf['memory']
        lv.cpus = conf['cpus']
        lv.cputopology :sockets => 1, :cores => conf['cpus'], :threads => '1'
      end
    end
  end
end

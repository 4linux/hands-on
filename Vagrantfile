# -*- mode: ruby -*-
# vi: set ft=ruby :
vms = {

  'server1' => {'memory' => '1024', 'cpus' => 1, 'ip' => '10', 'box' => 'centos/7', 'provision' => 'server1.sh'},
  'server2' => {'memory' => '1024', 'cpus' => 1, 'ip' => '11' , 'box' => 'debian/buster64', 'provision' => 'server2.sh'},
  'server3' => {'memory' => '1024', 'cpus' => 1, 'ip' => '12' , 'box' => 'debian/buster64', 'provision' => 'server3.sh'},
  'server4' => {'memory' => '1024', 'cpus' => 1, 'ip' => '13' , 'box' => 'debian/buster64', 'provision' => 'server4.sh'}
}

Vagrant.configure('2') do |config|

  config.vm.box_check_update = false

  vms.each do |name, conf|
    config.vm.define "#{name}" do |my|
      my.vm.box = conf['box']
      my.vm.hostname = "#{name}.dexter.com.br"
      my.vm.network 'private_network', ip: "172.16.30.#{conf['ip']}"
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

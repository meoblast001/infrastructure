# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'centos/7'

  config.vm.provider :libvirt do |domain|
    domain.memory = 2048
  end

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  end

  config.vm.network 'private_network', type: 'dhcp'

  config.vm.provision 'shell', :inline => <<-SHELL
    yum install -y python2
    grep -q -F "vagrant ALL=(ALL) NOPASSWD: ALL" || echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
  SHELL

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'site.yml'
    ansible.limit = 'all'
    ansible.host_vars = {
        'default' => {
            'unix.passwords.deploy' => 'a1b2c3',
            'postgresql.passwords.deploy' => '1234567890',
            'postgresql.passwords.application' => 'abcdefghij',
            'kksystem.secret_key_base' => '10101010',
          }
      }
  end
end

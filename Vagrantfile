# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'fedora/23-cloud-base'

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  end

  config.vm.network 'forwarded_port', :guest => 80, :host => 3000

  config.vm.provision 'shell', :inline => <<-SHELL
    ln -s /etc/dnf/dnf.conf /etc/yum.conf
    dnf install -y python2 python2-dnf
    grep -q -F "vagrant ALL=(ALL) NOPASSWD:/bin/sh" || echo "vagrant ALL=(ALL) NOPASSWD:/bin/sh" >> /etc/sudoers
  SHELL

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'site.yml'
    ansible.limit = 'all'
    ansible.host_vars = {
        'default' => {
            'unix.passwords.deploy' => 'a1b2c3',
            'postgresql.passwords.deploy' => '1234567890',
            'postgresql.passwords.application' => 'abcdefghij',
          }
      }
  end
end

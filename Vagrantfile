# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty32"

  config.vm.provider :virtualbox do |p|
    p.memory = 2048
  end

  config.vm.network "forwarded_port", guest: 3000, host: 3000   # rails s
  config.vm.network "forwarded_port", guest: 5000, host: 5000   # foreman start

  config.ssh.forward_agent = true

  config.vm.synced_folder "/coding/workspace_safe", "/coding/vagrant_workspace_safe",
    owner: "vagrant",
    group: "vagrant",
    mount_options: ["dmode=775,fmode=664"]

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provision :shell, :path => "prep.sh"

  config.vm.provision :shell, :path => "install-apt.sh"
  config.vm.provision :shell, :path => "install-rvm.sh",  :args => "stable"
  config.vm.provision :shell, :path => "install-ruby.sh", :args => "2.1.2 rails"
  config.vm.provision :shell, :path => "install-psql.sh", :args => "vagrant"

  # Heroku
  config.vm.provision :shell, :inline => "wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh"
  config.vm.provision :file, :source => "~/.netrc", :destination => "/home/vagrant/.netrc"
  config.vm.provision :shell, :inline => "chmod 0600 /home/vagrant/.netrc"

  # Misc configs
  config.vm.provision :file, :source => "~/.gitconfig", :destination => "/home/vagrant/.gitconfig"
  config.vm.provision :file, :source => "~/.vimrc", :destination => "/home/vagrant/.vimrc"

end

# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.provider :virtualbox do |p|
    p.gui = false
    p.memory = 2048
  end

  config.vm.network "forwarded_port", guest: 3000, host: 3000   # rails server
  config.vm.network "forwarded_port", guest: 5000, host: 5000   # foreman start

  config.ssh.forward_agent = true

  # https://github.com/fgrehm/vagrant-cachier/issues/175
  config.cache.synced_folder_opts = {
    owner: "_apt",
    group: "_apt"
  }

  config.vm.synced_folder "/home/sfalkho/Documents/github", "/coding_sync/github",
    owner: "vagrant",
    group: "vagrant",
    mount_options: ["dmode=775,fmode=664"]

  # Misc configs
  config.vm.provision :file, :source => "~/.ssh", :destination => "/home/vagrant/.ssh"
  config.vm.provision :file, :source => "~/.gitconfig", :destination => "/home/vagrant/.gitconfig"
  config.vm.provision :file, :source => "~/.vimrc", :destination => "/home/vagrant/.vimrc"

  # https://stackoverflow.com/a/8636711/128977
  config.vm.provision :shell, :inline => "echo 'Defaults env_keep += \"DEBIAN_FRONTEND\"' | sudo EDITOR='tee -a' visudo"

  config.vm.provision :shell, :path => "install-rvm.sh", :args => "stable"

  # Heroku
  config.vm.provision :shell, :inline => "wget -qO- https://cli-assets.heroku.com/install.sh | sh"
  config.vm.provision :file, :source => "~/.netrc", :destination => "/home/vagrant/.netrc"
  config.vm.provision :shell, :inline => "chmod 0600 /home/vagrant/.netrc"

end

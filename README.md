vagrantfile-rails
=================

Vagrantfile (etc) for Rails dev stack.

Features
--------

| Resource | Flavor |
| :------------ | ---------------: |
| OS | Ubuntu 14.04 LTS |
| Vagrant box | ubuntu/trusty32 |
| RVM | stable |
| Ruby | 2.1.2 |
| Gems | rails |
| Heroku | Toolbelt |
| PostgreSQL | apt-get default  |



Contents
--------
* [Setup: Required](#required) ~ *You'll need to install these to use this repo.*
* [Setup: Personalize](#personalize) ~ *Set your synced folder, share your SSH keys.*
* [First Run](#first) ~ *A few likely first steps; clone git repo, run rake tasks.*
* [Vagrant Commands](#commands) ~ *Vagrant up/destroy/etc command reference.*
* [Notes](#notes) ~ *Misc additional info, if you care.*
* [Troubleshooting](#troubleshooting) ~ *Troubleshooting.*


<a name="required"></a>
Setup: Required
-----

#### Step 1: Install VirtualBox
* [https://www.virtualbox.org/wiki/Linux_Downloads](https://www.virtualbox.org/wiki/Linux_Downloads)

Install the appropriate package for your system. My current distro is Linux Mint, so I use one of these:

    Linux Mint 16 ~> Ubuntu Saucy (13.10)
    Linux Mint 17 ~> Ubuntu Trusty (14.04 LTS)


#### Step 2: Install Vagrant
* [http://docs.vagrantup.com/v2/installation/index.html](http://docs.vagrantup.com/v2/installation/index.html)
* [http://www.vagrantup.com/downloads](http://www.vagrantup.com/downloads)

Install the appropriate package for your system. For a Debian-based 64-bit OS, for instance, you'd use:

    Linux DEB 64-bit

#### Step 3: Install vagrant-cachier extension
* [https://github.com/fgrehm/vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)

This enables apt-get to avoid re-downloading package data upon each `vagrant destroy; vagrant up;` cycle.

    vagrant plugin install vagrant-cachier



<a name="personalize"></a>
Setup: Personalize
------------------

#### Customize synced folders

Remember to edit `config.vm.synced_folder` in Vagrantfile to personalize your synced folder path.

```
config.vm.synced_folder "/host/system/path", "/path/as/seen/from/within/vm"
```

#### Share SSH key for GitHub access

Assuming `~/.ssh/id_rsa` is your key location, this Vagrantfile is already configured to share.

```sh
Vagrant.configure("2") do |config|
  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.ssh.forward_agent = true
end
```

Your private key must be available to the local ssh-agent. On your host system, check with `ssh-add -L`, if it's not listed add with `ssh-add ~/.ssh/id_rsa`.

```sh
key_file=~/.ssh/id_rsa

# Add if not already added
[[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file
```

Problems? See the [Troubleshooting](#troubleshooting) section below.



<a name="first"></a>
First Run
---------

```sh
cd /path/to/your/workspace   # quite likely this matches your synced folder path
git clone git@github.com:User/Repo.git
cd Repo
bundle install   # ideally your .rvmrc covers this step
rake db:create:all
rake db:migrate
rake test:prepare
rake db:seed
```

If you're using Heroku, you'll also need to remember to add the remote heroku repository reference:

```sh
git remote add heroku git@heroku.com:Repo.git
```



<a name="commands"></a>
Vagrant Commands
--------

| Command | What it does |
| --- | --- |
| vagrant box add ubuntu/trusty64 | Add a Vagrant box, eg Ubuntu 14.04 |
| vagrant box list | List your Vagrant boxes |
| vagrant init | Create basic Vagrantfile (not needed since you're using this GitHub project) |
| vagrant up | Run the VM for the first time |
| vagrant ssh | Use the VM |
| vagrant provision | If you've edited the Vagrantfile, this re-provisions the VM |
| vagrant suspect | Pause the VM |
| vagrant halt | Stop the VM |
| vagrant destroy | Destroy the VM |

[Official Vagrant CLI reference](http://docs.vagrantup.com/v2/cli/)


<a name="notes"></a>
Notes
-----

#### Alternate Vagrant boxes
* [https://vagrantcloud.com/discover/popular](https://vagrantcloud.com/discover/popular)

#### General startup times
* Initial `vagrant up` = approx 31 minutes
* Subsequent `vagrant provision` = approx 7 minutes

  *Note: Obviously this will vary extensively based on your system. This is just a rough idea. May take notably longer on very first `vagrant up` since apt-get data is not yet cached.*

#### General provision actions
* install various apt packages
* install RVM, Ruby, Rails
* configure PostgreSQL user
* install Heroku toolbelt
* enable SSH forwarding, copy `~/.gitconfig` into VM
* forward ports 3000 and 5000 for `rails s` and `foreman start` defaults

  *Note: All provision actions can be run repeatedly -- `vagrant provision` on a running system is expected to succeed.*
  
  *That said, the longer operations are skipped -- eg RVM installation isn't run if `which rvm` returns successfully. Bear in mind this means that RVM / Ruby upgrades are not checked upon re-provision, only upon destroy/up.*



<a name="troubleshooting"></a>
Troubleshooting
---------------

#### GitHub access from VM

A couple possible errors:

##### Error: Permission denied (publickey).
##### Error: Could not open a connection to your authentication agent.

If you see one of these, then check your host system to verify whether `ssh-agent` is running. You may need to re-run it fresh, and possibly re-run the `ssh-add` commands from the [Setup: Personalize](#personalize) section above as well. (Not sure why this is, I may be overkilling the solution.)

```sh
killall ssh-agent; eval `ssh-agent`
```

##### Additional References:
* [https://coderwall.com/p/p3bj2a](https://coderwall.com/p/p3bj2a)
* [https://help.github.com/articles/using-ssh-agent-forwarding](https://help.github.com/articles/using-ssh-agent-forwarding)
* [http://stackoverflow.com/questions/11955525/how-to-use-ssh-agent-forwarding-with-vagrant-ssh](http://stackoverflow.com/questions/11955525/how-to-use-ssh-agent-forwarding-with-vagrant-ssh)


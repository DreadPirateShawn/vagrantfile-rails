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
| Ruby | 2.2.3 |
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

See [Vagrantfiles](https://github.com/DreadPirateShawn/vagrantfiles)



<a name="personalize"></a>
Setup: Personalize
------------------

See [Vagrantfiles](https://github.com/DreadPirateShawn/vagrantfiles)



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
rake db:schema:load RAILS_ENV=test
rake db:seed
```

If you're using Heroku, you'll also need to remember to add the remote heroku repository reference:

```sh
git remote add heroku git@heroku.com:Repo.git
```



<a name="commands"></a>
Vagrant Commands
--------

See [Vagrantfiles](https://github.com/DreadPirateShawn/vagrantfiles)



<a name="notes"></a>
Notes
-----

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

See [Vagrantfiles](https://github.com/DreadPirateShawn/vagrantfiles)


## Overview vagrant-postgres9.6
Automated vagrant postgres9.6 centos-7 setup

The pgbench and postgres / oracle gotcha demo scripts have been moved to dgapitts/pg-scripts i.e. as postgres user

For sample install details and a potential bug around 
https://gist.github.com/dgapitts/e1a99421e1cd96b43f668ec0d1e7ac20

There are a couple of prerequistes to be install on the hostmachine (i.e. your laptop):
* VirtualBox Download and Install from https://www.virtualbox.org/wiki/Downloads
* Vagrant Download and Install from https://www.vagrantup.com/downloads.html

## Details initial postgres user connection and psql check 

```
~/projects/vagrant-postgres9.6 $ vagrant ssh
sudo sudo -bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory
[localhost:vagrant:~] # sudo su - postgres
-bash-4.2$ psql
psql (9.6.10)
Type "help" for help.

postgres=#
```
 
## git setup and clone for pg-scripts as postgres user

cd ~
ssh-keygen
cat ~/.ssh/id_rsa.pub
<< copy results into your https://github.com/settings/profile - SSH >>
 
git clone git@github.com:dgapitts/pg-scripts.git



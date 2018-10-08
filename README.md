## Overview vagrant-postgres9.6 project and sister project pg-ora-demo-scripts

This project provides an automated vagrant postgres9.6 centos-7 setup in a few simple and quick steps (assuming you have Oracle VirtualBox and Hashicorp Vagrant already installed on your laptop - see links to downloading these prerequisites below)

The pgbench and postgres / oracle gotcha demo scripts have been moved to dgapitts/pg-ora-demo-scripts i.e. after setting up you vagrant-postgres9.6 VM (running Centos-7) then as postgres user:
* check basic psql access (details below)
* run "git setup and clone for pg-ora-demo-scripts" (delails below)

For sample install details and a potential bug around "Box 'centos/7' could not be found"
https://gist.github.com/dgapitts/e1a99421e1cd96b43f668ec0d1e7ac20

There are a couple of *prerequistes* to be install on the host machine (i.e. your laptop):
* VirtualBox Download and Install from https://www.virtualbox.org/wiki/Downloads
* Vagrant Download and Install from https://www.vagrantup.com/downloads.html

## Details - did automated install work as expected - initial basic postgres user connection and psql checks 

```
~/projects/vagrant-postgres9.6 $ vagrant ssh
sudo sudo -bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory
[localhost:vagrant:~] # sudo su - postgres
-bash-4.2$ psql
psql (9.6.10)
Type "help" for help.

postgres=#
```

## Details - git setup and clone for pg-ora-demo-scripts as postgres user

```
cd ~
ssh-keygen
cat ~/.ssh/id_rsa.pub
<< copy results into your https://github.com/settings/profile - SSH >>

git clone git@github.com:dgapitts/pg-ora-demo-scripts.git

Reference:
* "dgapitts/notes for my pg-ora-demo-scripts repro developement and tests" https://gist.github.com/dgapitts/1ca7e2eb4dfa475b1ffe1786277f7159
* "dgapitts/vagrant-postgres9.6"  https://github.com/dgapitts/vagrant-postgres9.6

## Post setup step1 - choose strong password for postgres and bench1 user

Even though this is a private VM, the ./update_alluser_passwords_from_changeme.sh will enable you to simple add a strong password (and will update the postgres ~/.pgpass file) 

```
~/projects/vagrant-postgres9.6 $ vagrant ssh
sudo su - sudo su - p[pg96centos7:vagrant:~] # sudo su - postgres
Last login: Sat Oct  6 20:40:06 UTC 2018
[pg96centos7:postgres:~] # ./update_alluser_passwords_from_changeme.sh M3LdCB4Qd7S4eLve
ALTER ROLE
ALTER ROLE
[pg96centos7:postgres:~] # cat ~/.pgpass
# hostname:port:database:username:password
localhost:5432:postgres:postgres:M3LdCB4Qd7S4eLve
localhost:5432:bench1:bench1:M3LdCB4Qd7S4eLve
```
checking bench1 user access
```
[pg96centos7:postgres:~] # psql -U bench1
psql (9.6.10)
Type "help" for help.

bench1=> exit
bench1-> \q
```
and finally you check postgres user access:
```
[pg96centos7:postgres:~] # psql -U postgres
psql (9.6.10)
Type "help" for help.

postgres=# \q
```


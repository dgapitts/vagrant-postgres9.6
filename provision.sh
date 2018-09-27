#! /bin/bash
if [ ! -f /home/vagrant/already-installed-flag ]
then
  echo "ADD EXTRA ALIAS VIA .bashrc"
  cat /vagrant/bashrc.append.txt >> /home/vagrant/.bashrc
  #echo "GENERAL YUM UPDATE"
  #yum -y update
  #echo "INSTALL GIT"
  yum -y install git
  #echo "INSTALL VIM"
  #yum -y install vim
  #echo "INSTALL TREE"
  yum -y install tree
  #echo "INSTALL unzip curl wget"
  yum  -y install unzip curl wget

  # https://gist.github.com/Ch4s3/d2270e8f3d30cadcce859b84d707c794 install-postgres-9.6-centos7.md
  rpm -ivh https://yum.postgresql.org/9.6/redhat/rhel-7.3-x86_64/pgdg-centos96-9.6-3.noarch.rpm
  yum -y update
  yum -y install postgresql96 postgresql96-server postgresql96-libs postgresql96-contrib postgresql96-devel
  /usr/pgsql-9.6/bin/postgresql96-setup initdb
  systemctl enable postgresql-9.6.service
  systemctl start postgresql-9.6.service 



else
  echo "already installed flag set : /home/vagrant/already-installed-flag"
fi


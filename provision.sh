#! /bin/bash
if [ ! -f /home/vagrant/already-installed-flag ]
then
  echo "ADD EXTRA ALIAS VIA .bashrc"
  cat /vagrant/bashrc.append.txt >> /home/vagrant/.bash_profile
  cat /vagrant/bashrc.append.txt >> /root/.bashrc
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
  #yum -y update
  yum -y install postgresql96 postgresql96-server postgresql96-libs postgresql96-contrib postgresql96-devel
  
  # default pg_hba.conf doesn't allow md5 i.e. password based authentication 
  #sudo cp /vagrant/pg_hba.conf /tmp/pg_hba.conf
  #sudo su -c "cp -p /var/lib/pgsql/9.6/data/pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf.`date '+%Y%m%d-%H%M'`.bak" -s /bin/sh postgres
  #sudo su -c "cat /tmp/pg_hba.conf > /var/lib/pgsql/9.6/data/pg_hba.conf" -s /bin/sh postgres

  /usr/pgsql-9.6/bin/postgresql96-setup initdb
  systemctl enable postgresql-9.6.service
  systemctl start postgresql-9.6.service 
  yum -y install python-psycopg2
  cat /vagrant/bashrc.append.txt >> /var/lib/pgsql/.bash_profile
  
  yum -y install sysstat
  systemctl start sysstat 
  systemctl enable sysstat
  sed -i 's#*/10#*/1#g' /etc/cron.d/sysstat
  /vagrant/quick-start-setup-pg-ora-demo-scripts.sh
  
  # default pg_hba.conf doesn't allow md5 i.e. password based authentication 
  cp /vagrant/pg_hba.conf /tmp/pg_hba.conf
  su -c "cp -p /var/lib/pgsql/9.6/data/pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf.`date '+%Y%m%d-%H%M'`.bak" -s /bin/sh postgres
  su -c "cat /tmp/pg_hba.conf > /var/lib/pgsql/9.6/data/pg_hba.conf" -s /bin/sh postgres
  systemctl stop  postgresql-9.6.service
  service postfix restart
  systemctl start postgresql-9.6.service 

  cp /vagrant/update_alluser_passwords_from_changeme.* /tmp
  su -c "cp -p /tmp/update_alluser_passwords_from_changeme.* ~" -s /bin/sh postgres
  su -c "chmod 700 ~/update_alluser_passwords_from_changeme.sh"  -s /bin/sh postgres
  #su -c "~/update_alluser_passwords_from_changeme.sh <new-secure-password>" -s /bin/sh postgres

  sudo cat /vagrant/environment >> /etc/environment

else
  echo "already installed flag set : /home/vagrant/already-installed-flag"
fi


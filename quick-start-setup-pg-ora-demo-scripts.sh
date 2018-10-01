sudo su -c "cd ~;pwd;git clone https://github.com/dgapitts/pg-ora-demo-scripts.git;ls -l pg-ora-demo-scripts" -s /bin/sh postgres
cp /vagrant/quick-start-setup-pg-ora-demo-scripts.sql /tmp/quick-start-setup-pg-ora-demo-scripts.sql
sudo su -c "psql postgres -f /tmp/quick-start-setup-pg-ora-demo-scripts.sql" -s /bin/sh postgres

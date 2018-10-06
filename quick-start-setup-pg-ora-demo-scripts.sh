su -c "cd ~;pwd;git clone https://github.com/dgapitts/pg-ora-demo-scripts.git;ls -l pg-ora-demo-scripts" -s /bin/sh postgres
cp /vagrant/quick-start-setup-pg-ora-demo-scripts.sql /tmp/quick-start-setup-pg-ora-demo-scripts.sql
cp /vagrant/pgpass /tmp/pgpass
su -c "psql postgres -f /tmp/quick-start-setup-pg-ora-demo-scripts.sql" -s /bin/sh postgres
su -c "cat /tmp/pgpass >> ~/.pgpass" -s /bin/sh postgres
su -c "chmod 600 ~/.pgpass" -s /bin/sh postgres

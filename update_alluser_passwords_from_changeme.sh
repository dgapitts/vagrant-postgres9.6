# https://askubuntu.com/questions/76808/how-do-i-use-variables-in-a-sed-command
sed -i "s/changeme/$1/g" ~/.pgpass
psql -U postgres -v v1="'$1'" -f update_alluser_passwords_from_changeme.sql

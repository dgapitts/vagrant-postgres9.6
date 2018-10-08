sudo su -c "yes y|ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa" -s /bin/sh postgres
echo ''
echo '---------------------------------------------------------------------------'
echo '---------------------------------------------------------------------------'
echo '---------------------------------------------------------------------------'
echo ''
echo "CUT AND PASTE THE FOLLOWING PUBLIC SSH KEY INTO YOUR GITHUB ACCOUNT"
echo "i.e.  under 'Settings' (right click your user icon in top right) then 'SSH and GPG Keys' then 'New SSH key'"
echo ''
echo '---------------------------------------------------------------------------'
echo '---------------------------------------------------------------------------'
echo '---------------------------------------------------------------------------'
echo ''
sudo cat /var/lib/pgsql/.ssh/id_rsa.pub
echo ''
echo '---------------------------------------------------------------------------'
echo '---------------------------------------------------------------------------'
echo '---------------------------------------------------------------------------'
echo ''
echo 'FIRST TIME ONLY fork https://github.com/dgapitts/pg-ora-demo-scripts'
echo 'Goto https://github.com/dgapitts/pg-ora-demo-scripts and then press Fork button In the top-right corner of the page, click Fork.'
echo '(as per https://help.github.com/articles/fork-a-repo/)'
cp /vagrant/developer-option-part2-setup-pg-ora-demo-scripts.sh /tmp
sudo su -c "cd /tmp/developer-option-part2-setup-pg-ora-demo-scripts.sh ~" /bin/sh postgres
echo ''
echo '---------------------------------------------------------------------------'
echo '---------------------------------------------------------------------------'
echo '---------------------------------------------------------------------------'
echo ''
echo 'Once you have added your github keys and forked the repo - su to postgres and run 
echo '~/developer-option-part2-setup-pg-ora-demo-scripts.sh userid useremail username'
echo "for example: ~/developer-option-part2-setup-pg-ora-demo-scripts.sh dgapitts dgapitts@gmail.com \"Dave Pitts\""



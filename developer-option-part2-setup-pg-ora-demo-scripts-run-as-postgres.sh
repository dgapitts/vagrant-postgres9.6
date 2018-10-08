if [ $# != 3  ]
then
    echo "PLEASE PASS THREE PARAMs i.e. GITHUB USERID EMAIL USERNAME e.g.  dgapitts dgapitts@gmail.com \"Dave Pitts"
    echo "i.e. the  GITHUB USER ACCOUNT details where you are going to clone YOUR fork of pg-ora-demo-scripts"
    exit 1
fi
git config user.email $2
git config user.name "$3"

cd ~;pwd;git clone git@github.com:$1/pg-ora-demo-scripts.git;ls -l pg-ora-demo-scripts
cd ~/pg-ora-demo-scripts;git checkout -b develop;git config --global push.default simple;git push --set-upstream origin develop;git status;git confif -l

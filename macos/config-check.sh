PWD=$PWD

echo ''
echo 'Downloading osx-config-check from https://github.com/kristovatlas/osx-config-check.git.'
echo ''
git clone https://github.com/kristovatlas/osx-config-check.git ~/.dotfiles/osx-config-check

echo ''
echo 'cd into downloaded directory.'
echo ''
cd ~/.dotfiles/osx-config-check

echo ''
echo 'run the app'
echo ''
python app.py

cd PWD
rm -rdf ~/.dotfiles/osx-config-check
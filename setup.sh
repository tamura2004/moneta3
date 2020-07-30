sudo apt update
sudo apt install build-essential sqlite3 libsqlite3-dev graphviz

cd
mkdir -p project/rails
mkdir src

cd src
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9
make install
echo 'source /usr/local/share/chruby/chruby.sh' >> /home/moneta/.bashrc
echo 'source /usr/local/share/chruby/auto.sh' >> /home/moneta/.bashrc
exec $SHELL -l

cd
cd src
wget -O ruby-install-0.7.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.1.tar.gz
tar -xzvf ruby-install-0.7.1.tar.gz
cd ruby-install-0.7.1
make install

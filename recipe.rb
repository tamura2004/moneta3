packages = [
  "build-essential",
  "sqlite3",
  "libsqlite3-dev",
  "graphviz"
]

packages.each do |name|
  package name
end

directory "/home/moneta/src"

execute "download and extruct chruby" do
  command "cd /home/moneta/src"
  command "wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz"
  command "tar -xzvf chruby-0.3.9.tar.gz"
  command "cd chruby-0.3.9"
  command "make install"
  command "echo 'source /usr/local/share/chruby/chruby.sh' >> /home/moneta/.bashrc"
  command "echo 'source /usr/local/share/chruby/auto.sh' >> /home/moneta/.bashrc"
end

execute "download and extruct ruby-install" do
  command "cd /home/moneta/src"
  command "wget -O ruby-install-0.7.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.1.tar.gz"
  command "tar -xzvf ruby-install-0.7.1.tar.gz"
  command "cd ruby-install-0.7.1"
  command "make install"
end

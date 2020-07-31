# apt update
# apt install -y git sudo
# mkdir -p /home/moneta/project/rails
# cd /home/moneta/project/rails
# git clone https://github.com/tamura2004/moneta3
# cd moneta3
# sudo bin/mitamae local recipe.rb

packages = [
  "wget",
  "build-essential",
  "sqlite3",
  "libsqlite3-dev",
  "graphviz",
  "nodejs",
  "npm",
  "curl"
]

packages.each do |name|
  package name do
    user "root"
  end
end

directory "src" do
  user "moneta"
  cwd "/home/moneta"
  mode "755"
  owner "moneta"
  group "moneta"
end

[
  "wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz",
  "tar -xzvf chruby-0.3.9.tar.gz",
].each do |cmd|
  execute cmd do
    not_if "ls /usr/local/share/chruby"
    user "moneta"
    cwd "/home/moneta/src"
  end
end

execute "make install" do
  not_if "ls /usr/local/share/chruby"
  user "root"
  cwd "/home/moneta/src/chruby-0.3.9"
end

[
  "echo 'source /usr/local/share/chruby/chruby.sh' >> .bashrc",
  "echo 'source /usr/local/share/chruby/auto.sh' >> .bashrc",
].each do |cmd|
  execute cmd do
    not_if "ls /usr/local/share/chruby"
    user "moneta"
    cwd "/home/moneta"
  end
end

[
  "wget -O ruby-install-0.7.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.1.tar.gz",
  "tar -xzvf ruby-install-0.7.1.tar.gz",
].each do |cmd|
  execute cmd do
    not_if "ruby-install -V"
    user "moneta"
    cwd "/home/moneta/src"
  end
end

execute "make install" do
  not_if "ruby-install -V"
  user "root"
  cwd "/home/moneta/src/ruby-install-0.7.1"
end

[
  "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -",
  "echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list",
  "apt update"
].each do |cmd|
  execute cmd do
    not_if "yarn --version | grep 1.22"
    user "root"
  end
end

package "yarn" do
  user "root"
end

[
  "npm install n -g",
  "n stable",
].each do |cmd|
  execute cmd do
    user "root"
  end
end

packages = [
  "sudo",
  "wget",
  "build-essential",
  "sqlite3",
  "libsqlite3-dev",
  "graphviz"
]

packages.each do |name|
  user "root"
  package name
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
    user "moneta"
    cwd "/home/moneta/src"
  end
end

execute "make install" do
  user "root"
  cwd "/home/moneta/src/chruby-0.3.9"
end

[
  "echo 'source /usr/local/share/chruby/chruby.sh' >> .bashrc",
  "echo 'source /usr/local/share/chruby/auto.sh' >> .bashrc",
].each do |cmd|
  execute cmd do
    user "moneta"
    cwd "/home/moneta"
  end
end

[
  "wget -O ruby-install-0.7.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.1.tar.gz",
  "tar -xzvf ruby-install-0.7.1.tar.gz",
].each do |cmd|
  execute cmd do
    user "moneta"
    cwd "/home/moneta/src"
  end
end

execute "make install" do
  user "root"
  cwd "/home/moneta/src/ruby-install-0.7.1"
end

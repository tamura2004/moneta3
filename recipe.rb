packages = [
  "build-essential",
  "sqlite3",
  "libsqlite3-dev",
  "graphviz"
]

packages.each do |name|
  package name
end

git "src/chruby" do
  repository "https://github.com/postmodern/chruby.git"
end

execute "setup.sh" do
  command "cd src/chruby; sh scripts/setup.sh"
end

git "src/ruby-install" do
  repository "https://github.com/postmodern/ruby-install.git"
end

execute "make install" do
  command "cd src/ruby-install; sudo make install"
end
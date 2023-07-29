# apt update
# apt install -y git sudo
# mkdir -p /home/#{ENV['USER']}/project/rails
# cd /home/#{ENV['USER']}/project/rails
# git clone https://github.com/tamura2004/moneta3
# cd moneta3
# sudo bin/mitamae local recipe.rb

[
  "wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz",
  "tar -xzvf chruby-0.3.9.tar.gz",
].each do |cmd|
  execute cmd do
    not_if "test -e /home/#{ENV['USER']}/src/chruby-0.3.9"
    user "#{ENV['USER']}"
    cwd "/home/#{ENV['USER']}/src"
  end
end

execute "make install" do
  not_if "test -e /usr/local/share/chruby"
  user "root"
  cwd "/home/#{ENV['USER']}/src/chruby-0.3.9"
end

%w(chruby.sh auto.sh).each do |sh|
  execute "echo 'source /usr/local/share/chruby/#{sh}' >> .bashrc" do
    not_if "cat /home/#{ENV['USER']}/.bashrc | grep #{sh}"
    user "#{ENV['USER']}"
    cwd "/home/#{ENV['USER']}"
  end
end

[
  "wget -O ruby-install-0.7.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.1.tar.gz",
  "tar -xzvf ruby-install-0.7.1.tar.gz",
].each do |cmd|
  execute cmd do
    not_if "test -e /home/#{ENV['USER']}/src/ruby-install-0.7.1"
    user "#{ENV['USER']}"
    cwd "/home/#{ENV['USER']}/src"
  end
end

execute "make install" do
  not_if "ruby-install -V"
  user "root"
  cwd "/home/#{ENV['USER']}/src/ruby-install-0.7.1"
end

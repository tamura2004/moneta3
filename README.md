# deploy@WSL

## OSインストール
* Windows Storeからダウンロード
ubuntu20.04

* OSユーザ名は、 moneta

## アップデート
```bash
$ sudo apt update
```
## moneta3のプロジェクトの導入
```bash
$ sudo apt install git
$ cd
$ mkdir -p project/rails
$ cd project/rails
$ git clone https://github.com/tamura2004/moneta3
$ cd moneta3
$ sudo bin/mitamae local recipe.rb
$ ruby-install ruby 2.7.2
$ exec $SHELL -l
$ sudo apt install libpq-dev
$ bundle install
$ yarn install
```

## moneta3のプロジェクトの初期設定
```bash
$ rails db:migrate
$ rails db:seed_fu
$ rails s
```

# deploy@docker
aws/ec2起動、ubuntu20.04

```bash
sudo apt update && sudo apt install docker.io
docker pull tamura/moneta3
docker run --name moneta3 -p 3000:3000 -d tamura/moneta3
docker exec moneta3 /bin/bash
rails db:migrate
rails db:seed_fu
```
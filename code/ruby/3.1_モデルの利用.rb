# 3.1 モデルの利用

## 3.1.1 件数を指定して読み取る
pp Bank.take(2)

## 3.1.2 SQLを確認する
puts Bank.where(number: 42).to_sql

## 3.1.2 特定のフィールドを取り出す
pp Bank.pluck(:name, :kana_name)

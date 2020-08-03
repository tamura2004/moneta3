# 1.1 文字列の出力

## 1.1.1 最も基本的な出力
puts "hello world"

## 1.1.2 デバッグ用出力
pp "hello world"

## 1.1.3 変数の埋め込み
name = "太郎"
age = 19
pp "#{name}さんは#{age}歳です"

## 1.1.4 変数の埋め込み(2)
age = 20
printf("%sさんは%d歳です\n", name, age)

## 1.1.5 変数の埋め込み(3)
age = 21
puts "%sさんは%d歳です" % [name, age]

## 1.1.6 外部コマンド出力の取り込み
puts `ls -la | tail -n 3`
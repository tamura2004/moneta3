# 文字列出力
puts "0: hello world"
pp "1: hello world"

# 文字列の結合
name = "山田太郎"
pp "2: " + name

## ダブルクォーテーションとシングルクォーテーションの違い

## 文字列の埋め込み
pp '3: ようこそ、#{name}'
pp "4: ようこそ、#{name}"

## 数字の埋め込み
age = 19
pp "5: #{name}さんは#{age}歳です"

## 文字列はメソッドを持つ
puts "6: methods"
pp name.chars
pp name.reverse

## メソッドチェーン（メソッドの連続利用）
pp name.chars.reverse

## メソッド呼び出しの別の方法
pp name.send(:chars)


__END__
数値
文字列
配列
ハッシュ
シンボル
範囲
ラムダ式
メソッド定義、呼び出し
メソッドチェーン
制御構造
イテレーション
クラス構造
　クラスメソッド
　インスタンスメソッド
　インスタンス変数
　継承
　オーバーライドとsuper


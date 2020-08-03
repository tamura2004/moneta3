# 1.8 ハッシュ（連想配列）

## 1.8.1 リテラル
taro = { name: "太郎", age: 19 }
pp taro

## 1.8.2 キー（シンボル）による参照
pp taro[:name]
pp taro[:age]

## 1.8.2 要素の追加と更新
hanako = {}
hanako[:name] = "花子"
hanako[:age] = 10
pp hanako
hanako[:age] += 2
pp hanako

# デフォルト値ありで初期化
counter = Hash.new(0)
counter[:taro] += 1
counter[:taro] += 1
counter[:hanako] += 1
counter[:taro] += 1
pp counter

## イテレーション
counter.each do |key, value|
  puts "#{key}さんは#{value}票です"
end
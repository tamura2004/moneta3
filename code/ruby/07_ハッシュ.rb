# ハッシュ
taro = { name: "太郎", age: 19 }
puts "---- 1"
pp taro[:name]
pp taro[:age]
puts "#{taro[:name]} is #{taro[:age]} years old."

# 要素の追加と更新
hanako = {}
hanako[:name] = "花子"
hanako[:age] = 10
hanako[:age] += 2
puts "---- 2"
puts "#{hanako[:name]} is #{hanako[:age]} years old."

# デフォルト値ありで初期化
counter = Hash.new(0)
counter[:taro] += 1
counter[:taro] += 1
counter[:hanako] += 1
counter[:taro] += 1
puts "---- 3"
pp counter
pp counter[:jiro]

## イテレーション
puts "---- 4"
counter.each do |key, value|
  puts "#{key}さんは#{value}票です"
end
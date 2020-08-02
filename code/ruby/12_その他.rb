# 3項演算子
puts "---- 1"
a = 10 < 20 ? "yes" : "no"
puts a

## シンボル
puts "---- 2"
taro = { name: "太郎" }
key = :name
pp key
pp taro[key]

## 代入演算子
puts "---- 3"
a = 0
a += 10
pp a
a -= 20
pp a
a /= 2
pp a

## 論理演算子
puts "---- 4"
a = 10 == 10
b = 10 != 10
pp a
pp b
pp a && b
pp a || b

## 論理代入演算子
puts "---- 5"
a = 10
b = nil

a ||= 100
b ||= 100

pp [a,b]
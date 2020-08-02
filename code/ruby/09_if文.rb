# 条件式
x = 10
puts "---- 1"
if x < 20
  puts "yes"
else
  puts "no"
end

## メソッドとの組み合わせ
puts "---- 2"
a = [1,2,3]
if a.size == 3
  puts "a has 3 member."
else
  puts "something wrong"
end

puts "---- 3"
taro = { age: 10 }
if taro.has_key?(:age)
  puts "taro is #{taro[:age]} years old"
else
  puts "no data"
end

## 後置き形式
puts "---- 4"
b = 0
puts "b is zero!" if b.zero?

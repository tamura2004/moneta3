# 2.0 制御構文

## 2.0.1 if文

### 論理演算子を利用
x = rand 1..10
if x < 4
  puts "#{x} is small!"
elsif x < 7
  puts "#{x} is middle!"
else
  puts "#{x} is big!"
end

### メソッドとの組み合わせ：range
x = rand 1..20
if (1..10).include? x
  puts "#{x} is in range."
else
  puts "#{x} is out."
end

### 後置き形式
taro = {}
roll = rand 1..10
taro[:age] = 10 if roll < 5
puts "taro is #{taro[:age]} years old" if taro.has_key?(:age)
puts "roll is #{roll}"

## 2.0.2 while文

### 条件が満たされるまで繰り返す
a = []
while a.size < 10
  a << rand(1..10)
  pp a
end

### 後置き形式
a.pop while a.size > 2
pp a

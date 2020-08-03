# 2.1 メソッド定義

## 2.1.1 def文
def min(a, b)
  a < b ? a : b
end
puts min(-10, 100)

## 2.1.2 yield文
def double
  yield 1
  yield 2
end

double do |i|
  puts "#{i}回目です"
end

## 2.1.3 ラムダ式
def minimum(x,y,z,f)
  f[f[x,y],z]
end
f = -> x,y { min x,y }
puts minimum(1,2,3,f)

## 2.1.4 ハッシュ引数
def show(params)
  pp params
end
show name: "太郎", age: 19

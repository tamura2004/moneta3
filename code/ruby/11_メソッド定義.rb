# メソッド定義
def min(a, b)
  a < b ? a : b
end

puts min(10,20)
puts min(10,2)

# ハッシュ引数
def show(params)
  pp params
end

show name: "太郎", age: 19


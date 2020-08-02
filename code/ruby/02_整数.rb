# 10進整数
a = 11
b = 7

## フォーマット出力
puts "#{a} + #{b} = #{a+b}"
printf "%d + %d = %d\n", a, b, a + b

## 関数定義
out = -> op do
  printf "%d %s %d = %d\n", a, op, b, a.send(op, b)
end

## 関数呼び出し
out[:-]
out[:*]
out[:/]
out[:%] # 剰余

## とても大きな数も扱える
puts "---- 2"
puts 2 ** 1000
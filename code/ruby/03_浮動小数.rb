# 浮動小数
a = 11.0
b = 7.0

## フォーマット出力
format = "%.2f %s %.2f = %.2f\n"
puts "#{a} + #{b} = #{a+b}"
printf format, a, "+", b, a + b

## 関数定義
out = -> op do
  printf format, a, op, b, a.send(op, b)
end

## 関数呼び出し
out[:-]
out[:*]
out[:/]
out[:%]

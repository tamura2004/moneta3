# 2進数
a = 0b110
b = 0b011

## フォーマット出力
puts "#{a} + #{b} = #{a+b}"
printf "%03b + %03b = %06b\n", a, b, a + b

## 関数定義
out = -> op do
  printf "%03b %s %03b = %06b\n", a, op, b, a.send(op, b)
end

## 関数呼び出し
out[:-]
out[:*]
out[:/]
out[:%]
out[:|] # 論理和 or
out[:&] # 論理積 and
out[:^] # 排他的論理和 xor

# 16進数
a = 0xAB12
b = 0x12AB

# フォーマット付き出力
F = "%#X %s %#X = %#X\n"

## フォーマット出力
puts "#{a} + #{b} = #{a+b}"
printf F, a, "+", b, a + b

## 関数定義
out = -> op do
  printf F, a, op, b, a.send(op, b)
end

## 関数呼び出し
out[:-]
out[:*]
out[:/]
out[:%]
out[:|] # 論理和 or
out[:&] # 論理積 and
out[:^] # 排他的論理和 xor

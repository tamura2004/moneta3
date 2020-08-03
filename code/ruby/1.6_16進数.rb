# 1.6_16進数
a = 0xAB12
b = 0x12AB

## 1.3.2 演算子

### 加算：#{a.to_s(16)} + #{b.to_s(16)} = #{(a + b).to_s(16)}
puts (a + b).to_s(16)

### 乗算：#{a.to_s(16)} * #{b.to_s(16)} = #{(a * b).to_s(16)}
puts (a * b).to_s(16)

### 減算：#{a.to_s(16)} - #{b.to_s(16)} = #{(a - b).to_s(16)}
puts (a - b).to_s(16)

### 乗算：#{a.to_s(16)} / #{b.to_s(16)} = #{(a / b).to_s(16)}
puts (a / b).to_s(16)

### ビットOR：#{a.to_s(16)} | #{b.to_s(16)} = #{(a | b).to_s(16)}
puts (a | b).to_s(16)

### ビットAND：#{a.to_s(16)} & #{b.to_s(16)} = #{(a & b).to_s(16)}
puts (a & b).to_s(16)

### ビットXOR：#{a.to_s(16)} ^ #{b.to_s(16)} = #{(a ^ b).to_s(16)}
puts (a ^ b).to_s(16)

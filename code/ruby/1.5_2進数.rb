# 1.5 2進数
a = 0b110
b = 0b011

## 1.5.1 演算子

### 加算：#{a.to_s(2)} + #{b.to_s(2)} = #{(a + b).to_s(2)}
puts (a + b).to_s(2)

### 乗算：#{a.to_s(2)} * #{b.to_s(2)} = #{(a * b).to_s(2)}
puts (a * b).to_s(2)

### 減算：#{a.to_s(2)} - #{b.to_s(2)} = #{(a - b).to_s(2)}
puts (a - b).to_s(2)

### 乗算：#{a.to_s(2)} / #{b.to_s(2)} = #{(a / b).to_s(2)}
puts (a / b).to_s(2)

### ビットOR：#{a.to_s(2)} | #{b.to_s(2)} = #{(a | b).to_s(2)}
puts (a | b).to_s(2)

### ビットAND：#{a.to_s(2)} & #{b.to_s(2)} = #{(a & b).to_s(2)}
puts (a & b).to_s(2)

### ビットXOR：#{a.to_s(2)} ^ #{b.to_s(2)} = #{(a ^ b).to_s(2)}
puts (a ^ b).to_s(2)

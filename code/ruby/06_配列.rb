# 配列
puts "---- 1"
pp [1,2,3]

## 配列のメソッド
puts "---- 2"
array = [6,5,5,4,4,4]
pp array
pp array.sort
pp array.uniq
pp array.sort.uniq
pp array.sum # 合計
pp array.tally # 出現数をカウント

## クラスの確認
puts "---- 3"
pp array.sort.uniq.class
pp array.sum.class
pp array.tally.class

## イテレーション
puts "---- 4"
array.each do |val|
  pp val
end

## 添え字付きイテレーション
puts "---- 5"
array.sort.each_with_index do |val, index|
  pp [val, index]
end

## 要素の追加・削除
puts "---- 6"
a = []
puts "---- 7"
pp a
a << 1
a.push 2,3 
puts "---- 8"
pp a
b = a.pop # 末尾から削除
c = a.shift # 先頭から削除
puts "---- 9"
pp a
pp [b,c]
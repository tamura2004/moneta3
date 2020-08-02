# 範囲オブジェクト
range = 5..10
puts "---- 1"
pp range
pp range.to_a

## 範囲内であるか判定
puts "---- 2"
pp range.include? 5
pp range.include? 12

## 範囲内に収める
puts "---- 3"
pp 1.clamp(range)
pp 100.clamp(range)
pp 7.clamp(range)

## イテレーション
puts "---- 4"
(1..3).each do |v|
  pp v
end
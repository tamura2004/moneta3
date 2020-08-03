# 1.9 範囲オブジェクト

## 1.9.1 リテラル
range = 5..10
pp range

### 1.9.2 メソッド

## 範囲内であるか判定

### #{range} is include 5 ?
pp range.include? 5

### #{range} is include 12 ?
pp range.include? 12

### 範囲内に収める
pp 1.clamp(range)
pp 100.clamp(range)
pp 7.clamp(range)

## イテレーション
(1..3).each do |v|
  pp v
end
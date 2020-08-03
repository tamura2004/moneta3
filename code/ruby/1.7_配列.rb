# 1.7 配列
pp [1,2,3]

## 1.7.1 配列のメソッド
a = [6,5,5,4,4,4]

### 並べ替え
pp a.sort

### 重複排除
pp a.uniq

### 並べ替えて重複排除
pp a.sort.uniq

### 合計
pp a.sum

### 集計
pp a.tally # 出現数をカウント

## 1.7.2 順次処理（イテレーション）

### 値を順次処理
a.each do |val|
  pp val
end

### 添え字付き
a.each_with_index do |val, index|
  pp [val, index]
end

### 変換
b = a.map { |val| val * 2 }
pp b

## 1.7.3 要素の追加・削除

### 添字による参照
a[1] = 7
pp a

### 末尾に追加： <<
a << 8
pp a

### 末尾に複数追加： push
a.push 2,3
pp a

### 先頭から削除： shift
b = a.pop # 末尾から削除
pp a
pp b

### 末尾から削除： pop
c = a.shift
pp a
pp c

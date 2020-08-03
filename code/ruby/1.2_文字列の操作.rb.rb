# 1.2 文字列の操作

## 1.2.1 結合
family_name = "山田"
given_name = "太郎"
name = family_name + "・フランシス・" + given_name
puts name

## 1.2.2 メソッドによる操作
### 文字に分解
pp name.chars

### 逆順にする
pp name.reverse

### 上の2つを一度で行う
pp name.reverse.chars

### 部分文字列の位置を検索（先頭は0文字目）
puts name.index("フランシス")

## 1.2.3 部分文字列

### 3文字目を取得
puts name[3]

### 3文字目から4文字取得
puts name[3,4]

### 6文字目から10文字目まで取得
puts name[6..10]

### 後ろから2文字目を取得
puts name[-2]

### 後ろから5文字目から3文字取得
puts name[-5,3]

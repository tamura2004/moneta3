# 1.10 正規表現

## 1.10.1 一致検索

### 部分一致
["しまうま", "しらたま", "かごしま"].each do |area|
  reg = /しま/
  print "#{area} は正規表現 #{reg} に"
  puts area =~ reg ? "マッチする" : "マッチしない"
end

### ピリオド．は任意の1文字に一致
["しまうま", "しらたま", "かごしま"].each do |area|
  reg = /し..ま/
  print "#{area} は正規表現 #{reg} に"
  puts area =~ reg ? "マッチする" : "マッチしない"
end

### アスタリスク＊は直前のパターンの０回以上の繰り返しに一致
["しまうま", "しらたま", "かごしま"].each do |area|
  reg = /し.*ま/
  print "#{area} は正規表現 #{reg} に"
  puts area =~ reg ? "マッチする" : "マッチしない"
end

### ＾記号は行の末尾に一致
["しまうま", "しらたま", "かごしま"].each do |area|
  reg = /しま$/
  print "#{area} は正規表現 #{reg} に"
  puts area =~ reg ? "マッチする" : "マッチしない"
end

### ＄記号は行の先頭に一致
["しまうま", "しらたま", "かごしま"].each do |area|
  reg = /^しま/
  print "#{area} は正規表現 #{reg} に"
  puts area =~ reg ? "マッチする" : "マッチしない"
end

## 1.10.2 文字列の置き換え

### ＄記号は行の先頭に一致
["しまうま", "しらたま", "かごしま"].each do |ante|
  post = ante.gsub(/しま/, "||||")
  puts "#{ante} を #{post} に変換"
end

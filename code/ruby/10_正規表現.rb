# 正規表現
puts "---- 1"
s = "alskdjfhg"
if s =~ /a.*d.*g/
  puts "s include adg subseq."
else
  puts "not include"
end

## 配列との組み合わせ
puts "---- 2"
a = ["さかなくん", "うさぎちゃん", "しまうまさん", "ぞうさん"]
a.each do |name|
  if name =~ /うさ/
    puts name
  end
end

## メソッドを利用
puts "---- 3"
pp a.grep(/うさ/)

## 置換
puts "---- 4"
a.each do |name|
  puts name.sub(/くん|ちゃん|さん/, "様")
end

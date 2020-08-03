# 2.2 クラス定義

class Human
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def show
    puts "#{name} is #{age} years old."
  end
end

## 2.2.1 要素を決めて初期化
taro = Human.new("太郎", 19)
pp taro.name
pp taro.age

## 2.2.2 要素の更新
taro.age += 10
taro.show

## 2.2.3 継承、オーバーライド
class FlyingHuman < Human
  def name
    "フライング" + super
  end
  def fly
    puts "マッハ１５で空を飛びます"
  end
end

hanako = FlyingHuman.new("花子", 10)
hanako.show
hanako.fly

## 2.2.4 継承元は変更されない＋例外処理
begin
  taro.fly
rescue => e
end

## 2.2.5 ビューにインスタンス変数を渡す例
View = Proc.new{ puts "--> #{@name} --> #{@age}" }
FlyingHuman.new("次郎", 16).instance_eval(&View)

# クラス定義
class User
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def show
    puts "#{name} is #{age} years old."
  end
end

puts "---- 1"
taro = User.new("太郎", 19)
pp taro.name
pp taro.age

taro.age += 10
taro.show

## 継承、オーバーライド
puts "---- 2"
class SuperUser < User
  def name
    "スーパー" + super
  end
end

hanako = SuperUser.new("花子", 10)
hanako.show

## ビューにインスタンス変数を渡す
puts "---- 3"
View = Proc.new{ puts "--> #{@name} --> #{@age}" }
SuperUser.new("次郎", 16).instance_eval(&View)

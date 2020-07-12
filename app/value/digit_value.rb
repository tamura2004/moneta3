class DigitValue
  attr_reader :n, :a

  def initialize(a, n = 4)
    case a
    when Array
      @a = a
      @n = a.size
    when Integer, String
      @a = (a.to_i.digits + [0] * n).first(n)
      @n = n
    end
  end

  def self.sample(a = 1, n = 4)
    max = 10 ** n - 1
    if a == 1
      new(rand(0..max), n)
    else
      Array.new(n){ new(rand(0..max), n) }
    end
  end

  def +(other)
    v = a.zip(other.a).map{ |x,y| (x + y) % 10 }
    DigitValue.new(v, n)
  end

  def to_s
    a.reverse.join
  end

  def to_i
    to_s.to_i
  end
end



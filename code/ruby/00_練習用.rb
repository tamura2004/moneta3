require "pathname"
dir = "code/ruby/"
file = Pathname.new("01_文字列.rb")
num, name = file.basename.to_s.split(/_/)
num = num.to_i

10.upto(11) do |i|
  `cp #{dir}#{file.to_s} #{dir}#{num}.#{i}_#{name}.rb`
end
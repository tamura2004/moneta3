states = ["発生", "修正", "分析"]
states.each_with_index do |name, id|
  State.seed do |s|
    s.id = id + 1
    s.name = name
  end
end

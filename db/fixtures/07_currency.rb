CURRENCIES = [
  { name: "JPY", description: "日本円", rate_min: 1.0, rate_max: 1.0, symbol: "￥" },
  { name: "USD", description: "米ドル", rate_min: 50.0, rate_max: 500.0, symbol: "$" },
  { name: "GBP", description: "英ポンド", rate_min: 50.0, rate_max: 500.0, symbol: "£" },
  { name: "AUD", description: "豪ドル", rate_min: 50.0, rate_max: 500.0, symbol: "$" },
  { name: "XEU", description: "ユーロ", rate_min: 50.0, rate_max: 500.0, symbol: "€" },
  { name: "INR", description: "印ルピー", rate_min: 1.0, rate_max: 50.0, symbol: "Rs" },
]

CURRENCIES.each_with_index do |currency, id|
  Currency.seed do |s|
    s.id = id + 1
    s.name = currency[:name]
    s.description = currency[:description]
    s.rate_max = currency[:rate_max]
    s.rate_min = currency[:rate_min]
    s.symbol = currency[:symbol]
  end
end

CURRENCIES.each_with_index do |currency, id|
  lo, hi = currency[:rate_min], currency[:rate_max]
  rate = (hi + lo) / 2 # 初期値
  fluctuation = (hi - lo) / 2 # 全体の±25%を変動幅とする

  70.times do |i|
    Rate.seed do |s|
      rate += (rand - 0.5) * fluctuation
      rate = rate.clamp(lo..hi)
      s.rate = rate
      s.currency_id = id + 1
      s.changed_at = (70 - i).days.before
    end
  end
end

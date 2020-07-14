products = [
  { name: "普通預金", currency: "JPY", rate: "0.0", is_debit: false },
  { name: "定期預金", currency: "JPY", rate: "1.0", is_debit: false },
  { name: "積立定期預金", currency: "JPY", rate: "1.0", is_debit: false },
  { name: "米ドル預金", currency: "USD", rate: "2.0", is_debit: false },
  { name: "投資信託", currency: "JPY", rate: "4.0", is_debit: false },
  { name: "国債", currency: "JPY", rate: "1.0", is_debit: false },
  { name: "スピードくじ", currency: "JPY", rate: "5.0", is_debit: false },
  { name: "カードローン", currency: "JPY", rate: "5.0", is_debit: true },
  { name: "住宅ローン", currency: "JPY", rate: "5.0", is_debit: true },
  { name: "学資ローン", currency: "JPY", rate: "2.0", is_debit: true },
  { name: "フリーローン", currency: "JPY", rate: "5.0", is_debit: true },
  { name: "クレジットカード", currency: "JPY", rate: "15.0", is_debit: true },
]

products.each_with_index do |product, id|
  Product.seed do |s|
    s.id = id + 1
    s.name = product[:name]
    s.currency = product[:currency]
    s.rate = product[:rate]
    s.is_debit = product[:is_debit]
  end
end

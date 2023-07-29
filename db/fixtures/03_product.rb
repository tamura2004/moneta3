products = [
  { name: "普通預金", rate: "0.0", is_debit: false, is_fixed: false, is_credit: false },
  { name: "定期預金", rate: "1.0", is_debit: false, is_fixed: true, is_credit: false },
  { name: "外貨預金", rate: "20.0", is_debit: false, is_fixed: false, is_credit: false },
  { name: "投資信託", rate: "4.0", is_debit: false, is_fixed: true, is_credit: false },
  { name: "国債", rate: "2.0", is_debit: false, is_fixed: true, is_credit: false },
  { name: "スピードくじ", rate: "0.0", is_debit: false, is_fixed: false, is_credit: false },
  { name: "カードローン", rate: "5.0", is_debit: true, is_fixed: false, is_credit: false },
  { name: "住宅ローン", rate: "5.0", is_debit: true, is_fixed: false, is_credit: false },
  { name: "学資ローン", rate: "12.0", is_debit: true, is_fixed: false, is_credit: false },
  { name: "フリーローン", rate: "15.0", is_debit: true, is_fixed: false, is_credit: false },
  { name: "クレジットカード", rate: "15.0", is_debit: false, is_fixed: false, is_credit: true },
]

products.each_with_index do |product, id|
  Product.seed do |s|
    s.id = id + 1
    s.name = product[:name]
    s.rate = product[:rate]
    s.is_debit = product[:is_debit]
    s.is_fixed = product[:is_fixed]
    s.is_credit = product[:is_credit]
    s.minus_limit = 1000000
  end
end

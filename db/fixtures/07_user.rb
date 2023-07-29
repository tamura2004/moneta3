users = [
  { id_name: "akagi", name: "赤城一郎", kana_name: "あかぎいちろう" },
  { id_name: "aoki", name: "青木一郎", kana_name: "あおきいちろう" },
  { id_name: "midori", name: "緑川三郎", kana_name: "あおきじろう" },
]

credit_card = Product.find_by(name: "クレジットカード")
branch = Branch.find_by(name: "もねたカード")

users.each_with_index do |user, id|
  credit_number = Array.new(3){ "%04d" % rand(10000) }.join("-")
  Account.seed do |s|
    s.id = id + 1
    s.number = credit_number
    s.amount = 0
    s.user_id = id + 1
    s.branch_id = branch.id
    s.product_id = credit_card.id
    s.currency_id = Currency.find_by(name: "JPY").id
  end

  User.seed do |s|
    s.id = id + 1
    s.id_name = user[:id_name]
    s.name = user[:name]
    s.kana_name = user[:kana_name]
    s.masked_password = 0
    s.account_id = id + 1
  end
end

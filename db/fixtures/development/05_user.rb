users = [
  { id_name: "akagi", name: "赤城一郎", kana_name: "あかぎいちろう" },
  { id_name: "aoki", name: "青木一郎", kana_name: "あおきいちろう" },
  { id_name: "aoki", name: "青木二郎", kana_name: "あおきじろう" },
  { id_name: "aoki", name: "青木三郎", kana_name: "あおきさぶろう" },
  { id_name: "aoki", name: "青木四郎", kana_name: "あおきしろう" },
  { id_name: "aoki", name: "青木五郎", kana_name: "あおきごろう" },
  { id_name: "aoki", name: "青木六郎", kana_name: "あおきろくろう" },
]

credit_card = Product.find_by(name: "クレジットカード")
branch = Branch.find_by(name: "もねたカード")

users.each_with_index do |user, id|
  credit_number = User.generate_random_credit_number
  Account.seed do |s|
    s.id = id + 1
    s.number = credit_number
    s.amount = 0
    s.user_id = id + 1
    s.branch_id = branch.id
    s.product_id = credit_card.id
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

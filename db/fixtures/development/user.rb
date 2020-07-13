users = [
  { id_name: "akagi", name: "赤城一郎", kana_name: "あかぎいちろう" },
  { id_name: "aoki", name: "青木一郎", kana_name: "あおきいちろう" },
  { id_name: "aoki", name: "青木二郎", kana_name: "あおきじろう" },
  { id_name: "aoki", name: "青木三郎", kana_name: "あおきさぶろう" },
  { id_name: "aoki", name: "青木四郎", kana_name: "あおきしろう" },
  { id_name: "aoki", name: "青木五郎", kana_name: "あおきごろう" },
  { id_name: "aoki", name: "青木六郎", kana_name: "あおきろくろう" },
]

users.each_with_index do |user, id|
  credit_number = User.generate_random_credit_number
  User.seed do |s|
    s.id = id + 1
    s.id_name = user[:id_name]
    s.name = user[:name]
    s.kana_name = user[:kana_name]
    s.masked_password = 0
    s.credit_number = credit_number
  end

  Account.seed do |s|
    s.id = id + 1
    s.name = "クレジットカード"
    s.user_id_name = user[:id_name]
    s.number = credit_number
    s.is_debit = true
    s.amount = 0
    s.branch_id = 2
  end
end


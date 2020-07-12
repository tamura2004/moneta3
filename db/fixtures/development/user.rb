User.seed do |s|
  s.id = 1
  s.id_name = "akagi"
  s.kanji_name = "赤城一郎"
  s.kana_name = "あかぎいちろう"
  s.masked_password = 122
  s.credit_number = User.generate_random_credit_number
end

User.seed do |s|
  s.id = 2
  s.id_name = "aoki"
  s.kanji_name = "青木次郎"
  s.kana_name = "あおきじろう"
  s.masked_password = 8546
  s.credit_number = User.generate_random_credit_number
end

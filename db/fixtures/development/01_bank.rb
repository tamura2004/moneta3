names = [
  "もねた",
  "かりす",
  "きるけ",
  "てみす",
  "ぽぽす",
]

$id = 1
names.each do |name|
  Bank.seed do |s|
    s.id = $id
    s.number = DigitValue.sample.to_i
    s.name = name + "銀行"
    s.kana_name = name
    s.myself = $id == 1
  end
  $id += 1
end



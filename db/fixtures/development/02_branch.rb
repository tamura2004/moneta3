names = [
  "おひつじ",
  "おうし",
  "ふたご",
  "かに",
  "しし",
  "おとめ",
  "てんびん",
  "さそり",
  "いて",
  "やぎ",
  "みずがめ",
  "うお",
  "れちくる",
  "みなみのさんかく",
  "らしんばん",
]

$bank_id = 1
$id = 1

names.reverse.each_slice(3) do |arr|
  Branch.seed do |s|
    s.id = $id
    s.number = 1
    s.name = "本店営業部"
    s.kana_name = "ほんてん"
    s.bank_id = $bank_id
  end
  $id += 1

  arr.each do |name|
    Branch.seed do |s|
      s.id = $id
      s.number = DigitValue.sample(1, 3).to_i
      s.name = name + "座支店"
      s.kana_name = name
      s.bank_id = $bank_id
    end
    $id += 1
  end
  $bank_id += 1
end

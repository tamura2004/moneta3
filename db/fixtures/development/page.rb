pages = {
  title: "もねた銀行",
  description: "お取引をお選びください",
  pages: [
    { title: "入出金" },
    { title: "残高照会" },
    { title: "振込" },
    {
      title: "口座開設",
      pages: [
        { title: "普通預金" },
        { title: "定期預金" },
        { title: "積立定期預金" },
      ]
    },
    {
      title: "資産運用",
      pages: [
        { title: "外貨預金" },
        { title: "投資信託" },
        { title: "国債" },
        { title: "スピードくじ" },
      ]
    },
    {
      title: "お借入",
      pages: [
        { title: "カードローン" },
        { title: "住宅ローン" },
        { title: "学資ローン" },
        { title: "フリーローン" },
      ]
    },
    {
      title: "店舗検索",
      pages: [
        { title: "営業店" },
        { title: "ＡＴＭ" },
      ]
    },
    {
      title: "ご質問",
      pages: [
        { title: "お申込み" },
        { title: "変更・解約" },
        { title: "認証" },
        { title: "振込等手続" },
        { title: "主要なサービス" },
      ]
    },
  ]
}

$id = 1

def create(page, parent)
  Page.seed do |s|
    s.id = $id
    s.title = page[:title]
    s.description = page[:description] || "todo:機能説明"
    s.page_id = parent if parent
  end
  parent = $id
  $id += 1
  page[:pages]&.each do |child|
    create(child, parent)
  end
end

create(pages, nil)

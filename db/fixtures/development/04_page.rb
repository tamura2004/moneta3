pages = {
  title: "もねた銀行",
  description: "お取引をお選びください",
  pages: [
    {
      title: "残高・入出金明細",
      description: "ご利用口座の残高一覧です",
      path: "/accounts",
    },
    {
      title: "振込",
      description: "ご指定先への送金を行います",
      path: "/transfer/new",
    },
    {
      title: "お預入・お引出",
      pages: [
        { title: "普通預金", path: "/accounts/new?name=普通預金", },
        { title: "定期預金", path: "/accounts/new?name=定期預金", },
        { title: "外貨預金", path: "/accounts/new?name=米ドル預金" },
        { title: "投資信託", path: "/accounts/new?name=投資信託" },
        { title: "国債", path: "/accounts/new?name=国債" },
        { title: "スピードくじ", path: "/accounts/new?name=スピードくじ" },
      ]
    },
    {
      title: "お借入・ご返済",
      pages: [
        { title: "カードローン", path: "/accounts/new?name=カードローン" },
        { title: "住宅ローン", path: "/accounts/new?name=住宅ローン" },
        { title: "学資ローン", path: "/accounts/new?name=学資ローン" },
        { title: "フリーローン", path: "/accounts/new?name=フリーローン" },
      ]
    },
    {
      title: "ご質問",
      pages: [
        {
          title: "店舗検索",
          pages: [
            { title: "営業店", path: "/branches/1" },
            { title: "ＡＴＭ", path: "/branches/2" },
          ]
        },
        {
          title: "各種変更・手続き",
          path: "/questions/1",
          pages: [
            { title: "変更・解約", path: "/questions/2" },
            { title: "認証", path: "/questions/3" },
            { title: "振込等手続", path: "/questions/4" },
            { title: "主要なサービス", path: "/questions/5" },
          ]
        }
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
    s.page_id = parent
    s.path = page[:path]
  end
  parent = $id
  $id += 1
  page[:pages]&.each do |child|
    create(child, parent)
  end
end

create(pages, nil)

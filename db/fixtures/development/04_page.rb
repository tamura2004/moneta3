pages = {
  title: "もねた銀行",
  description: "お取引をお選びください",
  pages: [
    {
      title: "口座開設",
      pages: [
        { title: "普通預金", path: "/accounts/new?name=普通預金", },
        { title: "定期預金", path: "/accounts/new?name=定期預金", },
        { title: "積立定期預金", path: "/accounts/new?name=積立定期預金", },
      ]
    },
    {
      title: "残高照会",
      description: "保有口座の残高一覧になります",
      path: "/accounts",
    },
    {
      title: "資金移動",
      description: "お預入れやお引き出しを行います",
      pages: [
        {
          title: "入出金",
          description: "電子マネーとの入出金ができます",
          path: "/transfers/new?name=1"
        },
        { 
          title: "振込",
          description: "資金移動を行います",
          path: "/transfers/new?name=2"
        },
      ]
    },
    {
      title: "資産運用",
      pages: [
        { title: "外貨預金", path: "/accounts/new?name=米ドル預金" },
        { title: "投資信託", path: "/accounts/new?name=投資信託" },
        { title: "国債", path: "/accounts/new?name=国債" },
        { title: "スピードくじ", path: "/accounts/new?name=スピードくじ" },
      ]
    },
    {
      title: "お借入",
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
          title: "お申込み",
          path: "/questions/1",
          pages: [
            { title: "変更・解約", path: "/questions/2" },
            { title: "認証", path: "/questions/3" },
            { title: "振込等手続", path: "/questions/4" },
            { title: "主要なサービス", path: "/questions/5" },
            {
              title: "お手続き",
              pages: [
                { title: "ログイン", path: "/login" },
                { title: "サインイン", path: "/signin" },
              ]
            },
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

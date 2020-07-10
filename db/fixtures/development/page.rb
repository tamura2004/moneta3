pages = {
  title: "もねた銀行",
  description: "お取引をお選びください",
  pages: [
    {
      title: "入出金",
      description: "電子マネーとの入出金ができます",
      path: "/transfers/new?type=1"
    },
    {
      title: "残高照会",
      description: "保有口座の残高一覧になります",
      path: "/accounts",
    },
    { 
      title: "振込",
      description: "資金移動を行います",
      path: "/transfers/new?type=2"
    },
    {
      title: "口座開設",
      pages: [
        {
          title: "普通預金",
          path: "/accounts/new?type=1",
        },
        {
          title: "定期預金",
          path: "/accounts/new?type=2",
        },
        {
          title: "積立定期預金",
          path: "/accounts/new?type=3",
        },
      ]
    },
    {
      title: "資産運用",
      pages: [
        {
          title: "外貨預金",
          path: "/accounts/new?type=4"
        },
        {
          title: "投資信託",
          path: "/accounts/new?type=5"
        },
        {
          title: "国債",
          path: "/accounts/new?type=6"
        },
        {
          title: "スピードくじ",
          path: "/accounts/new?type=7"
        },
      ]
    },
    {
      title: "お借入",
      pages: [
        {
          title: "カードローン",
          path: "/accounts/new?type=8"
        },
        {
          title: "住宅ローン",
          path: "/accounts/new?type=9"
        },
        {
          title: "学資ローン",
          path: "/accounts/new?type=10"
        },
        {
          title: "フリーローン",
          path: "/accounts/new?type=11"
        },
      ]
    },
    {
      title: "店舗検索",
      pages: [
        {
          title: "営業店",
          path: "/branches/1"
        },
        {
          title: "ＡＴＭ",
          path: "/branches/2"
        },
      ]
    },
    {
      title: "ご質問",
      pages: [
        {
          title: "お申込み",
          path: "/questions/1"
        },
        {
          title: "変更・解約",
          path: "/questions/2"
        },
        {
          title: "認証",
          path: "/questions/3"
        },
        {
          title: "振込等手続",
          path: "/questions/4"
        },
        {
          title: "主要なサービス",
          path: "/questions/5"
        },
      ]
    },
    {
      title: "お手続き",
      pages: [
        {
          title: "ログイン",
          path: "/login"
        },
        {
          title: "サインイン",
          path: "/signin"
        },
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
    s.path = page[:path] if page[:path]
  end
  parent = $id
  $id += 1
  page[:pages]&.each do |child|
    create(child, parent)
  end
end

create(pages, nil)

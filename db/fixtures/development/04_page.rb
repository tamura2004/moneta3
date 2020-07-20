pages = {
  title: "もねた銀行",
  description: "お取引をお選びください",
  pages: [
    {
      title: "お預入・お引出",
      pages: [
        { title: "普通預金", path: "/products/1/accounts/new", },
        { title: "定期預金", path: "/products/2/accounts/new", },
        { title: "外貨預金", path: "/products/3/accounts/new" },
        { title: "投資信託", path: "/products/4/accounts/new" },
        { title: "国債", path: "/products/5/accounts/new" },
        { title: "スピードくじ", path: "/products/6/accounts/new" },
      ]
    },
    {
      title: "残高・入出金明細",
      path: "/accounts",
    },
    {
      title: "振込",
      path: "/transfer/new",
    },
    {
      title: "お借入・ご返済",
      pages: [
        { title: "カードローン", path: "/products/7/accounts/new" },
        { title: "住宅ローン", path: "/products/8/accounts/new" },
        { title: "学資ローン", path: "/products/9/accounts/new" },
        { title: "フリーローン", path: "/products/10/accounts/new" },
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
    s.description = page[:description]
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

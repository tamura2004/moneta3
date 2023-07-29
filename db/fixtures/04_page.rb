pages = {
  title: "もねた銀行",
  description: "お取引をお選びください",
  pages: [
    {
      title: "口座開設",
      pages: [
        { title: "普通預金", path: "/products/1/accounts/new" },
        { title: "定期預金", path: "/products/2/accounts/new" },
        { title: "外貨預金", path: "/currencies" },
        { title: "投資信託", path: "/products/4/accounts/new" },
        { title: "国債", path: "/products/5/accounts/new" },
        { title: "スピードくじ", path: "/lotteries" },
      ],
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
      title: "お借入",
      pages: [
        { title: "カードローン", path: "/products/7/accounts/new" },
        { title: "住宅ローン", path: "/products/8/accounts/new" },
        { title: "学資ローン", path: "/products/9/accounts/new" },
        { title: "フリーローン", path: "/products/10/accounts/new" },
      ],
    },
    {
      title: "お問い合わせ",
      pages: [
        {
          title: "店舗検索",
          path: "/branches",
        },
        {
          title: "バグ報告",
          path: "/admin/state/1/issues",
        },
      ],
    },
  ],
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

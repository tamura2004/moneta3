# 利用者情報入力フォーム
class UserForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id_name, :string
  attribute :password, :integer
  attribute :masked_password, :integer
  attribute :name, :string
  attribute :kana_name, :string
  attribute :credit_number, :string
  attribute :account_id, :string

  validates :id_name, :password, :name, :kana_name, :credit_number, presence: true
  validates :id_name, format: { with: /\A[a-z]+\z/, message: "英子文字のみが使えます" }
  validates :id_name, length: { maximum: 6, too_long: "最大6文字です" }
  validates :password, format: { with: /\A[0-9]{4}\z/, message: "パスワードは数字4文字です" }
  validates :kana_name, format: { with: /\A\p{hiragana}+\z/, message: "ひらがなで入力して下さい" }
  validates :credit_number, format: { with: /\A(\d{4}\-){2}\d{4}\z/, message: "不正な番号です" }

  # 利用者情報登録
  def save
    return false if invalid?
    user = User.new(user_params)
    user.account = card
    user.masked_password = 1234 ^ password
    if user.save
      card.update(user: user)
    else
      card.destroy
      return false
    end
  end

  # 最初のクレジットカード（現金代わり）
  def card
    return @card if @card
    product = Product.find_by(name: "クレジットカード")
    branch = Branch.find_by(name: "もねたカード")
    @card = Account.new(number: credit_number, product: product, branch: branch)
    if @card.save
      @card
    else
      errors.add(:credit_number, "不明なエラーです")
      puts @card.inspect
      false
    end
  end

  def user_params
    attributes.symbolize_keys.extract!(:id_name, :name, :kana_name)
  end
end

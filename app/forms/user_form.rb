class UserForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations::Callbacks

  attribute :id_name, :string
  attribute :password, :integer
  attribute :masked_password, :integer
  attribute :name, :string
  attribute :kana_name, :string
  attribute :credit_number, :string
  attribute :account_id, :string

  validates :id_name, :password, :name, :kana_name, :credit_number, presence: { message: "%{attribute}を入力してください" }
  validates :id_name, format: { with: /\A[a-z]+\z/, message: "英子文字のみが使えます" }
  validates :id_name, length: { maximum: 6, too_long: "最大6文字です" }
  validates :password, format: { with: /\A[0-9]{4}\z/, message: "パスワードは数字4文字です" }
  validates :kana_name, format: { with: /\A\p{hiragana}+\z/, message: "ひらがなで入力して下さい" }
  validates :credit_number, format: { with: /\A(\d{4}\-){2}\d{4}\z/, message: "不正な番号です" }

  def save
    return false if invalid?
    params = attributes.symbolize_keys.extract!(:id_name, :name, :kana_name)
    params[:account_id] = find_or_create_credit_card.id
    params[:masked_password] = 1234 ^ password
    User.create(params)
  end

  def find_or_create_credit_card
    card.accounts.find_by(number: credit_number) ||
    card.accounts.create(number: credit_number)
  end

  def card
    Product.find_by(name: "クレジットカード")
  end
end

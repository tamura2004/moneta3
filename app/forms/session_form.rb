class SessionForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id_name, :string
  attribute :password, :string

  validates :id_name, :password, presence: true
  validates :id_name, format: { with: /\A[a-z]+\z/, message: "英子文字のみが使えます" }
  validates :id_name, length: { maximum: 6, too_long: "最大6文字です" }
  validates :password, format: { with: /\A[0-9]{4}\z/, message: "パスワードは数字4文字です" }
 
  validate :user_presence
  validate :password_valid

  def user_presence
    if !user
      errors.add(:id_name, "存在しないユーザーです")
    end
  end
  
  def password_valid
    if password.to_i ^ 1234 != user&.masked_password
      errors.add(:password, "パスワードが違います")
    end
  end

  def user
    User.find_by(id_name: id_name)
  end
end

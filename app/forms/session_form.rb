class SessionForm
  include ActiveModel::Model
  attr_accessor :id_name, :password

  validates :id_name, presence: { message: "ユーザーIDを入力してください" }
  validates :id_name, format: { with: /\A[a-z]+\z/, message: "英子文字のみが使えます" }
  validates :id_name, length: { maximum: 6, too_long: "最大6文字です" }
  validates :password, presence: { message: "パスワードを入力してください" }
  validates :password, format: { with: /\A[0-9]{4}\z/, message: "パスワードは数字4文字です" }
  validate :user_presence
  validate :password_valid

  def user_presence
    unless user
      errors.add(:id_name, "存在しないユーザーです")
    end
  end
  
  def password_valid
    unless password.to_i ^ 1234 == user&.masked_password
      errors.add(:password, "パスワードが違います")
    end
  end
  
  def user
    @user ||= User.where(id_name: id_name).sample
  end
end

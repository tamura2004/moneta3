class SessionForm
  include ActiveModel::Model
  attr_accessor :id_name, :password

  validates :id_name, :password, presence: true
  validate :user_presence, :password_collect
  
  def user_presence
    errors.add(:id_name, "存在しないユーザーです") if !user
  end
  
  def password_collect
    unless password.to_i ^ 1234 == user&.masked_password
      errors.add(:password, "#{user&.name}様、パスワードが違います")
    end
  end
  
  def user
    @user ||= User.where(id_name: id_name).sample
  end
end

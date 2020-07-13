class ApplicationController < ActionController::Base
  before_action :authorize

  private

  def current_user
    id_name = cookies["id_name"]
    @current_user ||= User.where(id_name: id_name).sample if id_name
  end

  def mybank
    @mybank ||= Bank.find_by(myself: true)
  end

  def credit_card
    return nil unless current_user
    @credit_card ||= current_user.accounts.joins(:product).find_by("products.name = ?", "クレジットカード")
  end

  def authorize
    unless current_user
      redirect_to :login, alert: "お取引前にログインしてください"
    end
  end

  helper_method :current_user
end

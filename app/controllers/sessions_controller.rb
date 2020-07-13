class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
    @page = Page.new(title: "ログイン")
    @form = SessionForm.new
  end
  
  def create
    @form = SessionForm.new(session_params)
    if @form.valid?
      cookies["id_name"] = @form.id_name
      redirect_to page_url(1), notice: "ようこそ、#{current_user&.name}様"
    else
      render :new
    end
  end

  def destroy
    cookies.delete("id_name")
    @user = nil
    redirect_to page_url(1), notice: "ご利用ありがとうございました"
  end

  private

  def session_params
    params.require(:session).permit(:id_name, :password)
  end
end

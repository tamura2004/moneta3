class SessionsController < ApplicationController
  def new
    @page = Page.new(title: "ログイン")
    @session = Session.new
  end

  def create
    @user = User.find_by(id_name: params[:id_name])
    if @user
      cookies["id_name"] = @user.id_name
      cookies["kanji_name"] = @user.kanji_name
      redirect_to page_path(1)
    else
      render :new
    end
  end

  def destroy
    cookies.delete("id_name")
    cookies.delete("kanji_name")
    redirect_to page_path(1)
  end
end

class PagesController < ApplicationController
  skip_before_action :authorize
  
  def show
    @page = Page.find_by(id: params[:id])
    @pages = @page.pages
  end
end

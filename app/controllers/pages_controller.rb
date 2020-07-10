class PagesController < ApplicationController
  def show
    @page = Page.find_by(id: params[:id])
    @pages = @page.pages
  end
end

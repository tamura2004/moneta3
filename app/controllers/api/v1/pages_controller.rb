class Api::V1::PagesController < ActionController::API
  def index
    pages = Page.all
    render json: pages
  end
end

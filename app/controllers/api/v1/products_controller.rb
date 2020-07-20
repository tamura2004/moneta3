class Api::V1::ProductsController < ActionController::API
  def index
    products = Product.all
    render json: products
  end
end

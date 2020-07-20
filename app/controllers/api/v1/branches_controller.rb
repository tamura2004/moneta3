class Api::V1::BranchesController < ActionController::API
  def index
    branches = Branch.all
    render json: branches
  end
end

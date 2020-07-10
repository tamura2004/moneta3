class AccountsController < ApplicationController
  before_action :set_page, only: [:index, :show, :new]

  def index
  end

  def show
  end

  def new
  end

  def set_page
    @page = Page.new(title: "取扱金融商品")
  end
end

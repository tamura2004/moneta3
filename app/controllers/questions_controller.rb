class QuestionsController < ApplicationController
  before_action :set_page, only: [:index, :show]
  
  def index
  end

  def show
  end

  def set_page
    @page = Page.new(title: "よくあるご質問")
  end
end

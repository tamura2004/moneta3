class TransfersController < ApplicationController
  def new
    @page = Page.new(title: "資金移動")
  end
end

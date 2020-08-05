class QuestionsController < ApplicationController
  skip_before_action :authorize

  def index
    @questions = Question.all
  end
end

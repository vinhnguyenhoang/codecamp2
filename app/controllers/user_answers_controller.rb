class UserAnswersController < ApplicationController
  def index
    @user_answers = UserAnswer.all
  end
  def show
  end
end

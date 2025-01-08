class Admin::ChoicesController < ApplicationController
  before_action :require_admin, only: [ :update, :edit, :destroy]
  def index
    @choices = Choice.all
  end

  def show
    @choice = Choice.find(params[:id])
  end

  def edit
    @choice = Choice.find(params[:id])
  end

  def update
    choice = Choice.find(params[:id]).update(choice_params)
    if choice
      flash[:notice] = "Update choice successful"
    else
      flash[:alert] = "Update choice successful"
    end
    redirect_to admin_choices_path
  end

  def destroy
    choice = Choice.find(params[:id])
    if(choice.correct)
      flash[:alert] = "This is the answer of question:  #{choice.question.content}"
      redirect_to admin_choices_path
    end

    if choice.destroy
      flash[:notice] = "Destroy choice successful"
    else
      flash[:alert] = "Destroy choice successful"
    end
    redirect_to admin_choices_path
  end

  private

  def choice_params
    params.require(:choice).permit(:content, :correct)
  end

  def require_admin
    redirect_to admin_exams_path unless current_user&.admin? && current_user
  end
end

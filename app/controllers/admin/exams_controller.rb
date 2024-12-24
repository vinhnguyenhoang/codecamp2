class Admin::ExamsController < ApplicationController
  before_action :require_admin

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def require_admin
    redirect_to root_path unless current_user&.admin?
  end
end

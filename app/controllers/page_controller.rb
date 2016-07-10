class PageController < ApplicationController

  def index
    if session[:user_id].nil?
      redirect_to register_path
    elsif current_user.admin?
      redirect_to secret_path
    end
  end

  def secret
    redirect_to root_path unless current_user.admin?
  end
end

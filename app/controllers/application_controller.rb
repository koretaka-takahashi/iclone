class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  
  def redirect_if_not_logged_in
    return if logged_in?
    flash[:notice] = "権限がありません"
    redirect_to(feeds_url) # feeds_pathじゃダメなんだっけ？？？
  end
end

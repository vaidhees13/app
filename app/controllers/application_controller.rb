class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

# def check_params
 # if user_signed_in?
  #  super
 # else
  #  redirect_to new_user_session_path, :notice => 'if you want to add a notice'
    ## if you want render 404 page
    ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
 # end
# end
  def check_params
    @current_user.role.name == ADMIN
    if @user.role? :ADMIN
    redirect_to :controller => "user" ,:action => "show"
  else
    render 'new'
     end

  end
end
class UsersController < ApplicationController
  before_filter :check_params

  def index
    @user = User.all
  end

  def check_params
    @current_user.role.name == ADMIN
    if @user.role? :ADMIN
      redirect_to :controller => "user" ,:action => "index"
    else
      render 'new'
    end

  end







  def show
    @user = User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:role)

  end
end

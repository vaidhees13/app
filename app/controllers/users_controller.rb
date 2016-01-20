class UsersController < ApplicationController

  before_action :current_user, :except => [:new, :create]
  before_action :admin_only, :only => [:destroy]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to :controller => "sessions",:action => "new"
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
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:role_id,:admin)
  end

end


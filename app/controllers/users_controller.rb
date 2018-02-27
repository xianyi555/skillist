class UsersController < ApplicationController

  before_action :require_login, only: [:edit, :update, :destroy]
  # before_action :check_auth, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p @user.valid?
    if @user.valid?
      @user.save
      # WelcomeMailer.welcome_email(@user).deliver_later
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to new_user_path
    end

  end


  def show
    @user = User.find_by_id(params[:id])
    @message = Message.new
    @messages = Message.all
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :firstname, :lastname, :email, :city, :password)
  end

  def check_auth
    @user = User.find_by_id(params[:id])
    if current_user != @users
      flash[:notice] = "No hacking!"
      redirect_to login_path
    end
  end

end

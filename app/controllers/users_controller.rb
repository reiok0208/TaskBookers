class UsersController < ApplicationController
  before_action :authenticate_user!
  def new
  end
  def index
    @userinfo = current_user
    @bookinfo =Book.new
  	@users = User.all
  end

  def show
    @userinfo = User.find(params[:id])
    @bookinfo =Book.new
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user)
    end
  end

  private
  def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
  end


end

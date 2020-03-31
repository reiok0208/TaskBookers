class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :configure_permitted_parameters, if: :devise_controller?
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
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  private
  def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_show_path(current_user.id)
    end
  end


end

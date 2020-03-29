class UsersController < ApplicationController
  def new
  end
  def index
  	@users = User.all
  	@book = Book.new
  end

  def show
    @book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to user_path(@user)
    end
  end

  private
  def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
  end


end

class UsersController < ApplicationController
  def new
  end
  def index
  	@users = User.all
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  end

end

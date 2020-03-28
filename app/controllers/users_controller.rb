class UsersController < ApplicationController
  def new
  end
  def index
  	@book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to users_index_path
    else
      render :index
    end
  end
  def show
  end

  private
  def book_params
        params.require(:book).permit(:title, :body)
  end

end

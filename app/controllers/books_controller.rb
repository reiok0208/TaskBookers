class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to users_path
  end
  def show
  end
  def index
  	@books = Book.all
  end

  private
  def book_params
        params.require(:book).permit(:title, :body)
  end
end

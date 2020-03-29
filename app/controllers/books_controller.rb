class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book)
  end
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  def index
  	@books = Book.all
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      render :edit
    end
  end

  private
  def book_params
        params.require(:book).permit(:title, :body)
  end
end

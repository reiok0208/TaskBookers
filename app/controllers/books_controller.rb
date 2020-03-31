class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book)
    else
      flash[:danger] = @book.errors.full_messages
      redirect_to books_path
    end
  end
  def show
    @userid = Book.find(params[:id]) #Bookモデルから接続先の情報を持ってくる(URL:books/1なら1のカラム)
    @userinfo = @userid.user #@useridからuser_id(関連付け)を引き出す(_idは記入しない)
    @bookinfo =Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  def index
    @userinfo = current_user
    @bookinfo =Book.new
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
    else
      flash[:danger] = @book.errors.full_messages
      redirect_to book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      render :edit
    end
  end

  private
  def book_params
        params.require(:book).permit(:title, :body)
  end

  def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end

end

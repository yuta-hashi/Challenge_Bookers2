class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book), notice: 'You have created book successfully.'
  end

  def index
    @book = Book.new
    @book.user_id = current_user.id
    @books = Book.all
    @user = User.find(@book.user_id)
  end

  def show
    @book = Book.new
    @about_book = Book.find(params[:id])
    @user = User.find(@about_book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book), notice:'You have updated book successfully.'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:book_title, :book_body)
  end

end

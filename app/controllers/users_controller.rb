class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice:'You have updated user successfully.'
  end

  private
  def user_params
    params.require(:user).permit(:username, :introducution, :profile_image)
  end

  def book_params
    params.require(:user).permit(:book_title, :book_body)
  end

end

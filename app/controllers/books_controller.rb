class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      flash[:notice] ="You have created book successfully."
      redirect_to @book
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to edit_book_path(@book)
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end

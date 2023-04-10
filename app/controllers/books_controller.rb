class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end


  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @book =Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.new
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "book was successfully update."
     redirect_to book_path(@book.id)
   else
     render :edit
   end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
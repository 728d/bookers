class BooksController < ApplicationController
  def new
  end
  
  def show
  end

  def index
    @books = Book.all
  end

  def edit
  end
end
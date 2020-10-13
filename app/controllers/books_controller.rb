class BooksController < ApplicationController
  
  def new
    @page_title = 'Add Book'
    @book = Book.new
    @categories = Category.all.order(id: :asc)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Your book has been created"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Oops! Something went wrong!"
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
      flash[:notice] = "Your book has been updated"
      redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book deleted!"
    redirect_to books_path
  end

  def index
    @books = Book.all.order(id: :desc)
    @categories = Category.all.order(id: :asc)
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.all.order(id: :asc)
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :year, :price, :buy, :excerpt, :format, :pages, :category_id, :author_id, :publisher_id, :image)
  end
end


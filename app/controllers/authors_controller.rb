class AuthorsController < ApplicationController
  def new
    @page_title = 'Add Author'
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author Created!"
      redirect_to root_path
    else
      if Author.exists?(last_name: @author.last_name)
        flash[:alert] = "Already exists!"
      elsif Author.where(first_name: @author.first_name).empty?
        flash[:alert] = "Please put your First Name"
      elsif Author.where(last_name: @author.last_name).empty?
        flash[:alert] = "Please put your Last Name"
      else
        flash[:alert] = "Oops! Something went wrong!"
      end
      render 'new'
    end
  end

  def edit
    @author = Author.find(
    params[:id]
    )
  end

  def update
    @author = Author.find(
    params[:id]
    )
    @author.update(author_params)
    flash[:notice] = "Writer's name updated"
    redirect_to author_path(@author)
  end

  def destroy
    @author = Author.find(
    params[:id]
    )
    @author.destroy
    flash[:notice] = "Writer deleted!"
    redirect_to authors_path
  end

  def index
    @page_title = 'Writers'
    @authors = Author.all.order(id: :desc)
  end

  def show
    @author = Author.find(
    params[:id]
    )
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end

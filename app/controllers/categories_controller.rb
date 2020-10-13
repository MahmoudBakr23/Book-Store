class CategoriesController < ApplicationController
  def new
    @page_title = 'Add Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created!"
      redirect_to root_path
    else
      if Category.exists?(name: @category.name)
        flash[:alert] = "Already exists!"
      elsif Category.where(name: @category.name).empty?
        flash[:alert] = "Name your category"
      else
        flash[:alert] = "Oops! Something went wrong!"
      end
      render 'new'
    end
  end

  def edit
    @category = Category.find(
    params[:id]
    )
  end

  def update
    @category = Category.find(
    params[:id]
    )
    @category.update(category_params)
    flash[:notice] = "Category has been updated!"
    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(
    params[:id]
    )
    @category.destroy
    flash[:notice] = "Category deleted!"
    redirect_to categories_path
  end

  def index
    @page_title = 'Categories'
    @categories = Category.all.order(id: :desc)
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

class PublishersController < ApplicationController
  def new
    @page_title = 'Add Publisher'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = "Publisher Created!"
      redirect_to root_path
    else
      if Publisher.exists?(name: @publisher.name)
        flash[:alert] = "Already exists!"
      elsif Publisher.where(name: @publisher.name).empty?
        flash[:alert] = "Name your Publisher"
      else
        flash[:alert] = "Oops! Something went wrong!"
      end
      render 'new'
    end
  end

  def edit
    @publisher = Publisher.find(
    params[:id]
    )
  end

  def update
    @publisher = Publisher.find(
    params[:id]
    )
    @publisher.update(publisher_params)
    flash[:notice] = "Publisher has been updated!"
    redirect_to publisher_path(@publisher)
  end

  def destroy
    @publisher = Publisher.find(
    params[:id]
    )
    @publisher.destroy
    flash[:notice] = "Publisher deleted!"
    redirect_to publishers_path
  end

  def index
    @page_title = 'Publishers'
    @publishers = Publisher.all.order(id: :desc)
  end

  def show
    @publisher = Publisher.find(
    params[:id]
    )
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end

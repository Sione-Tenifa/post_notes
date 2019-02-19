class PagesController < ApplicationController
  def index
    @page = Post.all
  end

  def show
    @page = Post.find(params[:id])
  end

  def new
    @page = Post.new
  end

  def create
    @page = Post.new(pages_params)
 
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def edit
    @page = Post.find(params[:id])
  end

  def update
    @page = Post.find(params[:id])
  
    if @page.update(page_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to pages_path
  end

  private

  def pages_params
    params.require(:page).permit(:title, :author, :body)
  end
end

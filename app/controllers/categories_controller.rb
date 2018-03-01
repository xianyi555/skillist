class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @user = User.new
  end

  def show
    @category = Category.find_by_name(params[:name])
  end

  def new
    @user = User.find_by_id(session[:user_id])
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
      redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end

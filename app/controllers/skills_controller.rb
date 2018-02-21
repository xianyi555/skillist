class SkillsController < ApplicationController
  before_action :require_login, only: [:create, :edit, :update, :destroy]
  before_action :check_auth, only: [:edit, :update, :destroy]

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
    @user = User.find_by_id(@skill.user_id)
  end

  def new
    @category = Category.find_by_name(params[:name])
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skills_params)
    category = Category.find_by_name(params[:name])
    @skill.category_id = category.id
    @skill.user_id = current_user.id
    if @skill.save
      redirect_to category_path(category.name)
    else
      flash[:notice] = "Oops! Something went wrong! Try again!"
      redirect_to new_skill_path
    end
  end

  def edit
    @skill = Skill.find_by_id(params[:id])
  end

  def update
    skill = Skill.find_by_id(params[:id])

    if skill.update(skills_params)
      flash[:notice] = "Updated successfully!"
      redirect_to user_path(skill.user_id)
    else
      flash[:notice] = "Oops! Something went wrong! Try again!"
      redirect_to edit_skill_path
    end
  end


  def destroy
    skill = Skill.find_by_id(params[:id])
    skill.delete
    redirect_to user_path(skill.user_id)
  end

  private

  def skills_params
    params.require(:skill).permit(:name, :description, :cost)
  end

  def check_auth
    @skill = Skill.find_by_id(params[:id])
    if current_user != @skill.user
      flash[:notice] = "No hacking!"
      redirect_to login_path
    end
  end


end

class SiteController < ApplicationController
  def index
    @skills = Skill.all
    @categories = Category.all
    @users = User.all
    skill = Skill.find_by_id(params[:id])
  end 
end

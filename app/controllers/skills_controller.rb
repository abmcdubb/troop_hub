class SkillsController < ApplicationController
autocomplete :badge, :name

  def show
    @event = Event.new
    @skills = Skill.order(name: :asc)
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @events = Event.where(:skill_id => params[:id]).order(name: :asc).paginate(page: params[:page], per_page: 10)
    @skill_name = Skill.find(params[:id]).name.upcase
  end

  def category_index    
    @event = Event.new
    @skills = Skill.order(name: :asc)
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @skill_name = params[:id].upcase
    @events = Event.find_by_skill_category( @skill_name).order(name: :asc).paginate(page: params[:page], per_page: 10)
  end
end
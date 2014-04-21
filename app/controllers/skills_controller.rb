class SkillsController < ApplicationController
autocomplete :badge, :name

  def show
    @event = Event.new
    @skills = Skill.all
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @events = Event.where(:skill_id => params[:id]).paginate(page: params[:page], per_page: 10)
  end

  def category_index
    
    @event = Event.new
    @skills = Skill.all
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @events = Event.find_by_skill_category(params[:id]).paginate(page: params[:page], per_page: 10)
  end
end
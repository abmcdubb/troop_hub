class SkillsController < ApplicationController

  def show
    @events = Event.where(:skill_id => params[:id])
  end

  def category_index
    @events = Event.find_by_skill_category(params[:id])
  end
end
class SkillsController < ApplicationController
  def index
  end

  def show
    
    @events = Event.where(:skill_id => params[:id])

  end
end

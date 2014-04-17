class SkillsController < ApplicationController
  def index
  	@skills = Skill.all
  end

  def show
  	
  end
end

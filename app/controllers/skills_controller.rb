class SkillsController < ApplicationController
  def index
  end

  def show
    @nature_skills = Skill.where(:category => "Nature & Ecology")
  end
end

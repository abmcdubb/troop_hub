class SkillsController < ApplicationController
  before_action :set_adult, only: [:new, :create]

  def new
    @skill = Skill.new
    @skills = Skills.all

  end

  def create
    @skill = Skill.new(skill_params)
    @skill.adult_id = @adult.id

    respond_to do |format|
      if @skill.save
        format.html { redirect_to troops_path, notice: 'Skill was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end

  end

  private
    def set_adult
      @adult = Adult.find(params[:adult_id])
    end

    def skill_params
      params.require(:skill).permit(:troop_id, :adult_id, :name, :description)
    end
end



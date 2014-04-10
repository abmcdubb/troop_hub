class SkillsController < ApplicationController
#we might need to delete this controller

  def index

  end

  private
    def set_adult
      @adult = Adult.find(params[:adult_id])
    end

  
end



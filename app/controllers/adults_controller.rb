class AdultsController < ApplicationController
  include AdultsHelper

  before_action :set_adult, only: [:show, :edit, :update, :destroy]

  def index
    @adults = Adult.all
    @troop = Troop.find(params[:troop_id])
  end

  def show

  end

  def new
    @adult = Adult.new
    @skills = Skill.all
  end

  def create
    @adult = Adult.create(adult_params)

    add_skills_to_adults(@adult.id, skills_params[:skill_ids], skills_params[:descriptions])

    respond_to do |format|
      if @adult.save
        format.html { redirect_to troops_path, notice: 'Adult was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @adult.destroy
  end

private

  def set_adult
    @adult = Adult.find(params[:id])
  end

  def adult_params
    params.require(:adult).permit(:troop_id, :name, :number, :email, :adult_role, :phone_number, :profile_photo, :admin_privileges)
  end

  def skills_params
    params.require(:adult).permit(:skill_ids => [], :descriptions => [])
  end
end

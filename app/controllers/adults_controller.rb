class AdultsController < ApplicationController
  before_action :set_troop, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @adult = Adult.new
  end

  def create
    @adult = Adult.create(adult_params)
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
    params.require(:adult).permit(:troop_id, :name, :number, :email, :phone_number, :profile_photo, :special_skills, :admin_privileges)
  end
end

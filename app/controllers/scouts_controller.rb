class ScoutsController < ApplicationController
  before_action :set_scout, only: [:show, :edit, :update, :destroy]
  
  def index
    @scouts = Scout.all
  end

  def new
    @scout = Scout.new
  end

  def create
    #raise params.inspect
    #binding.pry
    @scout = Scout.create(scout_params)
    #binding.pry
    respond_to do |format|
      if @scout.save
        format.html { redirect_to scouts_path, notice: 'Scout was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_scout
    @scout = Scout.find(params[:id])
  end

  def scout_params
    params.require(:scout).permit(:name, :troop_id, :grade, :birthday, :email, :phone_number, :admin_privileges, :dues, :profile_photo)
  end
end

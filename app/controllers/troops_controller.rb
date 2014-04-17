class TroopsController < ApplicationController
  before_action :set_troop, only: [:show, :edit, :update, :destroy]

  def index
    @troops = Troop.all
     @daisies = Troop.all_Daisy
     @brownies = Troop.all_Brownie
     @juniors = Troop.all_Junior
     @cadettes = Troop.all_Cadette
     @seniors = Troop.all_Senior
     @ambassadors = Troop.all_Ambassador
     @age_levels = AgeLevel.all
  end

  def show
    # @troops = Troop.where(params[:troop_id])
    # @scouts = Scout.where(params[:id])
    @troop_events = TroopEvent.all
  end

  def new
    @troop = Troop.new
    @age_levels = AgeLevel.all
  end

  def create
    @troop = Troop.create(troop_params)
    @troop.user_ids = current_user.id
    @age_levels = AgeLevel.all

    respond_to do |format|
      if @troop.save
        format.html { redirect_to troops_path, notice: 'Troop was successfully created.' }
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
  end

  def home
    @age_levels = AgeLevel.all
    @badges = Badge.all
  end


private
  def set_troop
    @troop = Troop.find(params[:id])
  end

  def troop_params
    params.require(:troop).permit(:name, :number, :age_level_id, :city, :state, :zip_code, :meetup_location, :about_us, {:user_ids => [] } )
  end

end

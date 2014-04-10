class TroopsController < ApplicationController
  before_action :set_troop, only: [:show, :edit, :update, :destroy]

  def index
    @troops = Troop.all 
  end

  def show
    params.inspect
    # @troops = Troop.where(params[:troop_id])
    @scouts = Scout.where(params[:id])
    @troop_events = TroopEvent.all
  end

  def new
    @troop = Troop.new
  end

  def create
    @troop = Troop.create(troop_params)
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
  end

private
  def set_troop
    @troop = Troop.find(params[:id])
  end

  def troop_params
    params.require(:troop).permit(:name, :number, :troop_type, :city, :state, :zip_code, :meetup_location, :about_us)
  end

end

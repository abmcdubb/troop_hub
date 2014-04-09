class TroopEventsController < ApplicationController

  before_action :set_troop_event, only: [:show, :edit, :update, :destroy]

  def index
    @troop_events = TroopEvent.all
  end

  def show
  end

  def new
    @troop_event = TroopEvent.new
    if params[:event_id]
      @troop_event.event_id = params[:event_id]
    end
    if params[:troop_id]
      @troop_event.troop_id = params[:troop_id]
    end
    @events = Event.all
    @troops = Troop.all
  end

  def create
    @troop_event = TroopEvent.create(troop_event_params)
    respond_to do |format|
      if @troop_event.save
        format.html { redirect_to "/troops/#{@troop_event.troop_id}", notice: 'Troop was successfully created.' }
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

private
  def set_troop_event
    @troop_event = TroopEvent.find(params[:id])
  end

  def troop_event_params
    params.require(:troop_event).permit(:start_time, :location, :detail, :event_id, :troop_id)
  end

end
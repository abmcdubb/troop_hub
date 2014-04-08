class TroopEventsController < ApplicationController

  before_action :set_troop_events, only: [:show, :edit, :update, :destroy]

  def index
    @troop_events = TroopEvent.all
  end

  def show
  end

  def new
    @troop_events = TroopEvent.new
    if params[:event_id]
      @troop_events.event_id = params[:event_id]
    end
    @events = Event.all
  end

  def create
    @troop_event = TroopEvent.create(troop_event_params)
    respond_to do |format|
      if @troop_event.save
        format.html { redirect_to troop_events_path, notice: 'Troop was successfully created.' }
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
    params.require(:troop_event).permit(:date, :location, :detail)
  end

end
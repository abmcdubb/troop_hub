class EventsControllerController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Troop was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
  end

  def show
  end

private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :number, :troop_type, :city, :state, :zip_code, :meetup_location, :about_us)
  end

  

end

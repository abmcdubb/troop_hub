class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @badges=Badge.all
    @age_levels = AgeLevel.all
  end

  def create
    @event = Event.create(event_params)
    @badges = Badge.all
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_index_path, notice: 'Troop was successfully created.' }
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

  def advanced_search#eventually make this something that pops out in origional form and not it's own page. Use javascript.
    @age_levels = AgeLevel.all
    @badges = Badge.all
  end

  def search_results
    @events = Event.find_by_search_results(params[:event], params[:age_level_ids], params[:badge_ids])
  end

private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :genre, :description, :season, :location, :age_level_ids => [], :badge_ids => [])
  end

end

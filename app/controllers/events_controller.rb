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
        format.html { redirect_to events_index_path, notice: 'Event was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
    @badges=Badge.all
    @age_levels = AgeLevel.all
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    if @event.save
        redirect_to events_index_path, notice: 'Event updated.'
      else
        format.html { render action: 'edit' }
      end
  end

  def delete
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_index_path
  end

  def advanced_search#eventually make this something that pops out in origional form and not it's own page. Use javascript.
    @age_levels = AgeLevel.all
    @badges = Badge.all
  end

  def search_results
    @events = Event.find_by_search_results(params[:event], params[:age_level_ids], params[:badge_ids], params[:season])
  end

private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :genre, :description, :season, :location, :age_level_ids => [], :badge_ids => [])
  end

end

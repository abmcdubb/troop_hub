class TroopEventsController < ApplicationController
 autocomplete :badge, :name

  before_action :set_troop_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @troop_events = TroopEvent.all
  end

  def show
    @photos=@troop_event.photos
  end

  def new
    if current_user.admin_privileges < 50
      @troop_event = TroopEvent.new
      # if params[:event_id]
      @troop_event.event_id = params[:event_id]
      @event = Event.find(@troop_event.event_id)
      # end
      # if params[:troop_id]
      #   @troop_event.troop_id = params[:troop_id]
      # end
      # @events = Event.all
      @troops = current_user.troops

    else 
      redirect_to(:back)
    end
      
  end

#why is this here? how is it different than create
  def new_event
    @user = current_user
    if current_user.admin_privileges < 50
      @troops = Troop.all
      @age_levels = AgeLevel.all
      @badges = Badge.all
      @events = Event.all
      @event_badge = EventBadge.new
    else 
      redirect_to(:back)
    end
  end

#why is this here? how is it different than create. Answer: This is for creating event and troop event simultaniously
  def create_event
    @event = Event.create(event_params)
    @troop_event = TroopEvent.create(troop_event_params)
    @troop_event.event = @event

    if @troop_event.save
      redirect_to troop_event_path(@troop_event)
    else
      if current_user.admin_privileges < 50
        @troops = Troop.all
        @age_levels = AgeLevel.all
        @badges = Badge.all
        @events = Event.all
        @event_badge = EventBadge.new
        render "new_event"
      else 
        redirect_to("/")
      end
    end
  end

  def create
    set_calendar_params(params[:start_time_together])
    @troop_event = TroopEvent.create(troop_event_params)
    respond_to do |format|
      if @troop_event.save
        format.html { redirect_to "/troops/#{@troop_event.troop_id}", notice: 'This event has been succesfully added to your calendar.' }
      else
        @events = Event.all
        @troops = Troop.all
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

  def set_user
    @user = User.find(params[:id])
  end

  def set_troop_event
    @troop_event = TroopEvent.find(params[:id])
  end

  def set_calendar_params(start_time)
    params[:troop_event][:"start_time(1i)"] = start_time.match("\/").post_match.match("\/").post_match
    params[:troop_event][:"start_time(2i)"] = start_time.match("\/").pre_match
    params[:troop_event][:"start_time(3i)"] = start_time.match("\/").post_match.match("\/").pre_match
  end

  def troop_event_params
    params.require(:troop_event).permit(:start_time, :location, :detail, :event_id, :troop_id)
  end

  def event_params
    params.require(:event).permit(:name, :skill_id, :description, :season, :location, :age_levels => [], :badge_ids => [])
  end
  def event_badge_params
    params.require(:event_badge).permit(:event_id, :badge_id)
  end
end
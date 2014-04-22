class EventsController < ApplicationController
    #before_action :set_troop_event, only: [:show, :edit, :update, :destroy]
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new]
     autocomplete :badge, :name



  def index
    @events = Event.all
    @badges=Badge.all
    @age_levels = AgeLevel.all
    @skills = Skill.all
    @nature_skills = Skill.where(:category => "Nature & Ecology").order(name: :asc)
    @stem_skills = Skill.where(:category => "STEM").order(name: :asc)
    @business_skills = Skill.where(:category => "Business Smarts").order(name: :asc)
    @general_skills = Skill.where(:category => "General").order(name: :asc)
  end

  def show
    @skills = Skill.all
  end

  def new
    if current_user.admin_privileges < 50
      @event = Event.new
      @event_badge = EventBadge.new
      @troop_event = TroopEvent.new
      @badges=Badge.all
      @age_levels = AgeLevel.all
      @troops = Troop.all
      @skills = Skill.order(name: :asc)
    else
      redirect_to events_path
    end
  end

  def create
    @event = Event.create(event_params)
    @badges = params[:event][:badge_id][0].split(",")
    @badges.each do |b|
      @badge = Badge.find_by_name(b)
      @event_badge = EventBadge.create({:badge_id => @badge.id, :event_id => @event.id}) if @badge
    end
    @skills = Skill.order(name: :asc)
    #@troop_event = @event.troop_events.build(params[:troop_event])
    #there should be a seperate form for new event and new troop event?
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
      else
        @troop_event = TroopEvent.new
        @badges=Badge.all
        @age_levels = AgeLevel.all
        @troops = Troop.all
        @skills = Skill.order(name: :asc)
        @events = Event.all.paginate(page: params[:page], per_page: 10)
        format.html { render template: "skills/show", notice: 'Event was not createds' }
      end
    end
  end

  def edit
    if current_user.admin_privileges < 50
      @event = Event.find(params[:id])
      @badges=Badge.all
      @age_levels = AgeLevel.all
      @skills = Skill.all
    else
      redirect_to events_path
    end
  end


  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    if @event.save
        redirect_to events_path, notice: 'Event updated.'
      else
        @badges=Badge.all
        @age_levels = AgeLevel.all
        @skill = Skill.all
        format.html { render action: 'edit' }
      end
    end

  def advanced_search
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @skills = Skill.order(name: :asc)
  end

  def search_results
    @event = Event.new
    @skills = Skill.all
    @age_levels = AgeLevel.all
    @events = Event.find_by_search_results_with_too_many_forks(params[:event][:name], params[:event][:skill_id], params[:event][:age_level_ids], params[:event][:badge_ids], params[:event][:season]).order(name: :asc).paginate(page: params[:page], per_page: 10)
  end

private
  def set_event
    @event = Event.find(params[:id])
  end



  def event_params
    params.require(:event).permit(:name, :genre, :description, :season, :location, :badge_id, :skill_id, :age_level_ids => [], :badge_ids => [])
  end

  def set_troop_event
    @troop_event = TroopEvent.find(params[:id])
  end

  def troop_event_params
    params.require(:troop_event).permit(:start_time, :location, :detail, :event_id, :troop_id)
  end


  def badge_params
    params.require(:badge).permit(:name, :category)
  end

  def event_badge_params
    params.require(:event_badge).permit(:event_id, :badge_id)
  end
end

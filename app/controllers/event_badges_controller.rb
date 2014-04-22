class EventBadgesController < ApplicationController

autocomplete :badge, :name

  def index
    @event_badges = EventBadge.all
  end

  def new
    @event_badge = EventBadge.new
    @event = Event.new
  end

  def create
    # @user_badge = UserBadge.new
    # @user_badge.user_id = current_user.id
    # @user_badge.badge_id =
    @event = Event.new

    @badges = params[:event_badge][:badge][0].split(",")
    @badges.each do |b|
    @badge = Badge.find_by_name(b)
    @event_badge = EventBadge.create({:badge_id => @badge.id, :event_id => @event.id})
  end
    respond_to do |format|
      if @event_badge.save
        format.html { redirect_to "/", notice: 'Troop was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  

  def edit
  end


private
 def set_event_badge
  @event_badge = EventBadge.find(params[:id])
end


  def event_badge_params
    params.require(:user_badge).permit(:event_id, :badge_id)
  end

  def badge_params
    params.require(:badge).permit(:name, :category)
  end


  # def event_params
  #   params.require(:event).permit(:name, :genre, :description, :season, :location, :skill_id, :age_level_ids => [], :badge_ids => [])
  # end

  def set_troop_event
    @troop_event = TroopEvent.find(params[:id])
  end

  def troop_event_params
    params.require(:troop_event).permit(:start_time, :location, :detail, :event_id, :troop_id)
  end



end
class TroopsController < ApplicationController
  before_action :set_troop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  before_action :set_user, only: [:show]

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
    @user = current_user
    # @scouts = Scout.where(params[:id])
    @troop_events = TroopEvent.all
    @newsletter = Newsletter.all.last
    @news = TroopBlog.troop_news_feed(params[:id]).paginate(page: params[:page], per_page: 1)
    @sidebar_news = TroopBlog.sidebar_news_feed(params[:id])
    @troop_events = TroopEvent.all    
  end

  def new
  unless current_user.admin_privileges < 50
    redirect_to(:back)
  end
    @troop = Troop.new 
    @age_levels = AgeLevel.all
  end

  def create
    @troop = Troop.create(troop_params)
    @troop.user_ids = current_user.id
    @age_levels = AgeLevel.all

    respond_to do |format|
      if @troop.save
        format.html { redirect_to troop_show_path(@troop), notice: 'Troop was successfully created.' }
      else
        @age_levels = AgeLevel.all
        format.html { render action: 'new' }
      end
    end
  end

  def name_search
    if params[:troop]
      @troops = Troop.search_by_name(params[:troop])
    else
      redirect_to ("/")
    end
  end

  def location_search
    if params[:troop]
      @troops = Troop.search_by_location(params[:troop])
    else
      redirect_to ("/")
    end
  end

  def home
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @news = TroopBlog.homepage_news_feed
    @skills = Skill.all
    # @event = Event.new
    # @event_badge = EventBadge.new
    # @troops = Troop.all
    # @events = Event.all
  end


private
  def set_troop
    @troop = Troop.find(params[:id])
  end

  def troop_params
    params.require(:troop).permit(:name, :number, :age_level_id, :city, :state, :zip_code, :meetup_location, :about_us, {:user_ids => [] } )
  end

  def set_user
    @user = User.find(params[:id])
  end

end

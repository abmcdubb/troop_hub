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
    # @scouts = Scout.where(params[:id])
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
        format.html { redirect_to troops_path, notice: 'Troop was successfully created.' }
      else
        @age_levels = AgeLevel.all
        format.html { render action: 'new' }
      end
    end
  end

  def name_search
    @troops = Troop.search_by_name(params[:troop])
  end

  def location_search
    @troops = Troop.search_by_location(params[:troop])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def home
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @news = TroopBlog.homepage_news_feed
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

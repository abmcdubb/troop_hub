class TroopBlogsController < ApplicationController
  before_action :set_troop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  before_action :set_user, only: [:show]

  def show
    @user = current_user
    @newsletter = Newsletter.all.last
    @news = TroopBlog.troop_news_feed(params[:id]).paginate(page: params[:page], per_page: 10)
    @sidebar_news = TroopBlog.full_news_feed(params[:id])   
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
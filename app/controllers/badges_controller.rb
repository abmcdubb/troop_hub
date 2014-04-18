class BadgesController < ApplicationController

def index
  @badge = Badge.new
  @user_badge = UserBadge.new
end



private


  def badge_params
    params.require(:badge).permit(:name, :troop_type, :category, :logo)
  end
  def user_badge_params
    params.require(:user_badge).permit(:badge_id, :user_id)
  end



end
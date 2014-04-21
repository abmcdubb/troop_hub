class UserBadgesController < ApplicationController

 autocomplete :badge, :name

  def index
@user_badges = UserBadge.all
  end

  def new
    @user_badge = UserBadge.new
    @user = current_user
  end

  def create
    # @user_badge = UserBadge.new
    # @user_badge.user_id = current_user.id
    # @user_badge.badge_id =
    @badges = params[:user_badge][:badge][0].split(",")
    @badges.each do |b|
    @badge = Badge.find_by_name(b)
    @user = current_user
    @user_badge = UserBadge.create({:badge_id => @badge.id, :user_id => @user.id})
  end
    respond_to do |format|
      if @user_badge.save
        format.html { redirect_to "/users/#{current_user.id}", notice: 'Troop was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  

  def edit
  end


private
 def set_user_badge
  @user_badge = UserBadge.find(params[:id])
end


  def user_badge_params
    params.require(:user_badge).permit(:user_id, :badge_id, :badge)
  end

  def badge_params
    params.require(:badge).permit(:name, :category)
  end
end
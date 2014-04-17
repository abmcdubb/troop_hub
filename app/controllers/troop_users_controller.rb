class TroopUsersController < ApplicationController
before_action :set_troop_user, only: [:show]

  def index
    @troop_user = TroopUser.all

  end

  def show
    @user = @troop_user.user
    @troops = @user.troops
  end





private
  def set_troop_user
    @troop_user = TroopUser.find(params[:user_id])
  end

  def agenda_params
    params.require(:troop_user).permit(:troop_id, :user_id)
  end

end
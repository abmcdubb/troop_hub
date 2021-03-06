class TroopUsersController < ApplicationController
before_action :set_troop_user, only: [:show]
before_action :set_troop, only: [:index]

  def index
    if @troop.users.include?(current_user)
      @users = @troop.users
      @troop_user = TroopUser.all
    else
      redirect_to(:back)
    end
  end


private


  def set_troop_user
    @troop_user = TroopUser.find(params[:id])
  end

  def set_troop
    @troop = Troop.find(params[:troop_id])
  end

  def troop_user_params
    params.require(:troop_user).permit(:troop_id, :user_id)
  end

end
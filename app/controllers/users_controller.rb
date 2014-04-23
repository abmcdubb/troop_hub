class UsersController < ApplicationController
  before_filter :login_required

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # before_action :set_troop_user, only: [:show, :edit, :update, :destroy]

  def login_required
     authenticate_user!    
  end
  
  def index
    @troop = Troop.find(params[:troop_id])
    @users = @troop.users
  end

  # def new
  #   raise inspect.params
  #   # @troop = Troop.find_by(params[:troop_id])
  #   @user = User.new
  #   # @scouts = Scout.find(params[:troop_id])

  # end

  # def create
  #   @troop = Troop.find(params[:troop_id])
  #   @scout = @troop.scouts.new(scout_params) #associates scout with that troop
  #   respond_to do |format|
  #     if @scout.save
  #       format.html { redirect_to troops_path, notice: 'Scout was successfully created.' }
  #     else
  #       format.html { render action: 'new' }
  #     end
  #   end
  # end

  def show

    @user_badge = UserBadge.new
   intersection = current_user.troop_ids & @user.troop_ids
   @troop = Troop.find(intersection.first)  
   unless (!intersection.empty?) || (current_user.admin_privileges < 50 && !intersection.empty?) || (current_user.id == @user.id)
    redirect_to(:back)
  end
  
  end

  def edit
    @skills= Skill.all
    intersection = current_user.troop_ids & @user.troop_ids
    if intersection.empty?
      if (current_user != @user) || (current_user.admin_privileges < 50)
        redirect_to(:back)
      end
    end

  end

  def update
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end






  #   def set_troop_user
  #   @troop_user = TroopUser.find(params[:user_id])
  # end


  # def user_params
  #   params.require(:troop_user).permit(:troop_id)
  # end

end

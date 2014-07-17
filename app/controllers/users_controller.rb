class UsersController < ApplicationController

  include UsersHelper

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
    # if params[:user][:current_password] = @user.password
      @user.update_attributes(user_params)
      add_comma_seperated_skills_to_adults(@user.id, skills_params[:skill_ids], skills_params[:descriptions]) unless skills_params[:skill_ids].nil?
      if ! params[:user][:password].empty?
         @user.update_attributes(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
      end
      if @user.save
        redirect_to user_path(@user), notice: 'Your profile has been updated.'
      else
        @skills= Skill.all
        intersection = current_user.troop_ids & @user.troop_ids
        if (current_user != @user) && (current_user.admin_privileges < 50 && !intersection.empty?)
          redirect_to("/")
        else
          render "users/registrations/edit"
        end
      end
    # else
      # @skills= Skill.all
      # intersection = current_user.troop_ids & @user.troop_ids
      # render "users/registrations/edit"
    # end
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number) 
  end

  def skills_params
    params.require(:user).permit(:skill_ids => [], :descriptions => [])
  end

  #   def set_troop_user
  #   @troop_user = TroopUser.find(params[:user_id])
  # end


  # def user_params
  #   params.require(:troop_user).permit(:troop_id)
  # end

end

class UsersController < ApplicationController
  before_filter :login_required

  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  # def scout_params
  #   params.require(:scout).permit(:name, :troop_id, :grade, :birthday, :email, :phone_number, :admin_privileges, :dues, :profile_photo, :patches)
  # end
end

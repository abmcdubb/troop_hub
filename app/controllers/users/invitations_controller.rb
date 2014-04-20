class Users::InvitationsController < Devise::InvitationsController

prepend_before_filter :authenticate_inviter!, :only => [:new, :create]
  prepend_before_filter :has_invitations_left?, :only => [:create]
  prepend_before_filter :require_no_authentication, :only => [:edit, :update, :destroy]
  prepend_before_filter :resource_from_invitation_token, :only => [:edit, :destroy]
  helper_method :after_sign_in_path_for

  def create
    self.resource = invite_resource
    self.resource.name = params[:user][:name]
    self.resource.role = params[:user][:role]
    troop = Troop.find(params[:troop_id])
    self.resource.troops<< troop
    self.resource.save
    if resource.errors.empty?
      yield resource if block_given?
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end






  # PUT /resource/invitation
  def update
    self.resource = accept_resource
    if resource && resource.errors.empty?
      resource.update_attributes(user_params)
      if ((params[:user][:role] == "Parent") || (params[:user][:role] == "Troop Leader") || (params[:user][:role] == "Volunteer"))
        resource.birthday = nil
        resource.grade = nil
        (1..(Skill.all.length)).each do |x|
          user_skill = UserSkill.new(send("user_skill_#{x}_params"))
          if user_skill.skill_id
            user_skill.user_id = resource.id
            user_skill.save
            resource.save
          else
            user_skill.destroy
          end
        end
      end
    end

    if resource.errors.empty?
      yield resource if block_given?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active                                                                                        
      set_flash_message :notice, flash_message
      sign_in(resource_name, resource)
      respond_with resource, :location => after_accept_path_for(resource)
    else
      respond_with_navigational(resource){ render :edit }
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :admin_privileges, :profile_photo, :role, :birthday, :grade)
  end

  def user_skill_params
    params.require(:user_skill).permit(:ids => [], :descriptions => [])
  end

  def invite_resource(&block)
    resource_class.invite!(invite_params, current_inviter, &block)
  end
  
  def accept_resource
    resource_class.accept_invitation!(update_resource_params)
  end

  def current_inviter
    authenticate_inviter!
  end

  def has_invitations_left?
    unless current_inviter.nil? || current_inviter.has_invitations_left?
      self.resource = resource_class.new
      set_flash_message :alert, :no_invitations_remaining
      respond_with_navigational(resource) { render :new }
    end
  end
  
  def resource_from_invitation_token
    unless params[:invitation_token] && self.resource = resource_class.find_by_invitation_token(params[:invitation_token], true)
      set_flash_message(:alert, :invitation_token_invalid)
      redirect_to after_sign_out_path_for(resource_name)
    end
  end

  def invite_params
    devise_parameter_sanitizer.sanitize(:invite)
  end

  def update_resource_params
    devise_parameter_sanitizer.sanitize(:accept_invitation)
  end


  def user_skill_1_params
    if params[:user_skill_1][:skill_id]
      params.require(:"user_skill_1").permit(:skill_id, :skill_description)
    end
  end

  def user_skill_2_params
    if params[:user_skill_2][:skill_id]
      params.require(:"user_skill_2").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_3_params
    if params[:user_skill_3][:skill_id]
      params.require(:"user_skill_3").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_4_params
    if params[:user_skill_4][:skill_id]
      params.require(:"user_skill_4").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_5_params
    if params[:user_skill_5][:skill_id]
      params.require(:"user_skill_5").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_6_params
    if params[:user_skill_6][:skill_id]
      params.require(:"user_skill_6").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_7_params
    if params[:user_skill_7][:skill_id]
      params.require(:"user_skill_7").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_8_params
    if params[:user_skill_8][:skill_id]
      params.require(:"user_skill_8").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_9_params
    if params[:user_skill_9][:skill_id]
      params.require(:"user_skill_9").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_10_params
    if params[:user_skill_10][:skill_id]
      params.require(:"user_skill_10").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_11_params
    if params[:user_skill_11][:skill_id]
      params.require(:"user_skill_11").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_12_params
    if params[:user_skill_12][:skill_id]
      params.require(:"user_skill_12").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_13_params
    if params[:user_skill_13][:skill_id]
      params.require(:"user_skill_13").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_14_params
    if params[:user_skill_14][:skill_id]
      params.require(:"user_skill_14").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_15_params
    if params[:user_skill_15][:skill_id]
      params.require(:"user_skill_15").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_16_params
    if params[:user_skill_16][:skill_id]
      params.require(:"user_skill_16").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_17_params
    if params[:user_skill_17][:skill_id]
      params.require(:"user_skill_17").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_18_params
    if params[:user_skill_18][:skill_id]
      params.require(:"user_skill_18").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_19_params
    if params[:user_skill_19][:skill_id]
      params.require(:"user_skill_19").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_20_params
    if params[:user_skill_20][:skill_id]
      params.require(:"user_skill_20").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_21_params
    if params[:user_skill_21][:skill_id]
      params.require(:"user_skill_21").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_22_params
    if params[:user_skill_22][:skill_id]
      params.require(:"user_skill_22").permit(:skill_id, :skill_description)
    end
  end
  def user_skill_23_params
    if params[:user_skill_23][:skill_id]
      params.require(:"user_skill_23").permit(:skill_id, :skill_description)
    end
  end












end
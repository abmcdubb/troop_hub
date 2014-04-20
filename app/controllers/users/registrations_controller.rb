class Users::RegistrationsController < ::Devise::RegistrationsController
  # before_filter :configure_permitted_parameters, :only => [:create]
  include UsersHelper
  before_filter :configure_permitted_parameters, :only => [:create]
  
  def new
    @skills = Skill.all
    super
  end

  def edit
    @skills = Skill.all
  end
  

def update
end

  def create 
    sanitize_params_by_role 
    build_resource(sign_up_params)
    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
    add_skills_to_adults(resource.id, skills_params[:skill_ids], skills_params[:descriptions]) unless skills_params[:skill_ids].nil?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      @skills = Skill.all
      clean_up_passwords resource
      respond_with resource
    end  
  end

  def after_inactive_sign_up_path_for(resource)
    @skills = Skill.all
    respond_to?(:root_path) ? root_path : "/"
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:admin_privileges, :role, :name, :phone_number, :grade, :birthday, :badges, :profile_photo, :email, :password, :password_confirmation) }
  end

  def skills_params
    params.require(:user).permit(:skill_ids => [], :descriptions => [])
  end

  def troop_ids_param
    params.require(:user).permit(:troops_ids => [])
  end


  private
  def sanitize_params_by_role
    if params[:user][:role] != "Scout"
      params[:user][:birthday] = nil
      params[:user][:grade] = nil
    # else
    
      # params[:user][:skill_ids].clear

    end

  end
end

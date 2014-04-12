class RegistrationsController < Devise::RegistrationsController
  # before_filter :configure_permitted_parameters, :only => [:create]
  include AdultsHelper
  before_filter :configure_permitted_parameters, :only => [:create]
  
  def new
    @skills = Skill.all
    super
  end

  def create  
    @skills = Skill.all
    super
    add_skills_to_adults(resource.id, skills_params[:skill_ids], skills_params[:descriptions])
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:adult_role, :name, :phone_number, :email, :password, :password_confirmation) }
  end

  def skills_params
    params.require(:adult).permit(:skill_ids => [], :descriptions => [])
  end
end
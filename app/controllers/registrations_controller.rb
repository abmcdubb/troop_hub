class RegistrationsController < Devise::RegistrationsController
  # before_filter :configure_permitted_parameters, :only => [:create]
  
  def new
    @skills = Skill.all
    super
  end

  before_filter :configure_permitted_parameters, :only => [:create]

  protected

  def configure_permitted_parameters
    binding.pry
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:adult_role, :name, :phone_number, :email, :password, :password_confirmation) }
  end
end
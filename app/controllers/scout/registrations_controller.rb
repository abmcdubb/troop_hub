class Scout::RegistrationsController < ::Devise::RegistrationsController
  # before_filter :configure_permitted_parameters, :only => [:create]
  before_filter :configure_permitted_parameters, :only => [:create]

  def create
    binding.pry
    super
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :phone_number, :grade, :birthday, :profile_photo, :email, :password, :password_confirmation) }
  end

end
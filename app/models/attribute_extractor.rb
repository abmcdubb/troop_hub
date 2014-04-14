class AttributeExtractor < ActiveRecord::Base
  attr_reader :sign_up_params, :role

  def initialize(sign_up_params)
    @sign_up_params = sign_up_params
    @role = sign_up_params[:role].downcase
  end

  def default_params
    [:admin_privileges, :role, :name, :phone_number, :profile_photo, :email, :password, :password_confirmation]
  end

  def scout
    [:grade, :birthday]
  end

end
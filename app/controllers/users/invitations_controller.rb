class Users::InvitationsController < Devise::InvitationsController
  
  def update
    raise 7
    if false
      redirect_to root_path
    else
      super
    end
  end

  def accept
    raise 6
  end

  def edit
  end
end
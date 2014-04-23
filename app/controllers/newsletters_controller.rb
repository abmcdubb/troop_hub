class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show]

  def new 
    @newsletter = Newsletter.new
    if (@user = current_user)
    else
      redirect_to ("/")
    end
    # unless @user.admin_privileges < 50
    #   redirect_to(:back)
    # end
  end

  def create
    @user = current_user
     @newsletter = Newsletter.create(newsletter_params)
    respond_to do |format|
      if @newsletter.save
        NewsletterMailer.newsletter_email(@newsletter).deliver

        format.html { redirect_to "/troops/#{@newsletter.troop_id}", notice: 'Newsletter was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
  end
 
private
 def set_newsletter
  @newsletter = Newsletter.find(params[:id])
end

def newsletter_params
  params.require(:newsletter).permit(:item1_title, :item1_desc, :item2_title, :item2_desc, :item3_title, :item3_desc, :note_from_leader, :leader, :troop_id)
end


end
